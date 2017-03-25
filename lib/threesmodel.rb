require "threesmodel/version"
require 'threesmodel/candidate_translator'
require 'threesmodel/candidate_extractor'
require 'threesmodel/game_board_folder'
require 'threesmodel/next_number_positioner'
require 'threesmodel/next_number_determinator'
require 'threesmodel/game_over_checker'
require 'threesmodel/game_creator'
require 'securerandom'
require 'threesmodel/score_calculator'
require 'matrix'

module Threesmodel
  class InternalAPI
    def initialize

    end
  end

  class BaseGameAutomation
    def initialize
      @game_controller = Threesmodel::GameController.new
      @game_board_folder = GameBoardFolder.new
      @score_calculator = ScoreCalculator.new
      @scores = []
      @highest_cell_value_histogram = { c3: 0, c6: 0, c12: 0, c24: 0, c48: 0, c96: 0, c192: 0, c384: 0, c768: 0, c1536: 0, c3072: 0, c6144:0}
      @best_game = nil
    end

    def play;
      raise 'Method missing - please implement "play" method.';
    end

    def score_filename
      self.class.name + ".txt"
    end

    def play_many(times=100)
      max_score = 0
      iteration = 1
      times.times do
        @game = @game_controller.start_new_game
        score = play
        if score > max_score then
            max_score = score
            @best_game = @game[:game]
        end
        @scores << score
        print "." if iteration % 1000 == 0
        update_highest_value_histogram(@game[:game])
        iteration += 1
      end
      puts "Done!"
      puts max_score
      puts @highest_cell_value_histogram

      File.open(score_filename, "w+") do |f|
        f.puts(@scores)
      end

      puts "Best game is:"
      puts @best_game
    end

    def update_highest_value_histogram(game_board)
      highest_cell_value = 0
      game_board.each { |val|
        highest_cell_value = val if val > highest_cell_value
      }
      key = ("c" + highest_cell_value.to_s).to_sym
      @highest_cell_value_histogram[key] += 1
    end

  end


  class GameController

    def initialize
      @games = {}
      @next_number = {}
      @candidate_extractor = CandidateExtractor.new
      @candidate_translator = CandidateTranslator.new
      @game_over_checker = GameOverChecker.new
      @next_number_determinator = NextNumberDeterminator.new
      @number_positioner = NextNumberPositioner.new
      @game_board_folder = GameBoardFolder.new
    end

    def start_new_game
      id = SecureRandom.uuid
      @games[id] = GameCreator.create_new_game
      @next_number[id] = getNextNumber(@games[id])
      respond_to_player(id, @next_number[id])
    end

    def fold_right(id)
      game = @games[id]
      unless (@game_board_folder.can_fold_right?(game))
        return did_not_fold(game, id)
      end
      candidates = @candidate_translator.translate_right_fold(@candidate_extractor.fold_right_candidates(game))
      game = @game_board_folder.fold_right(game)
      prepare_for_next_fold(candidates, game, id)
    end

    def fold_left(id)
      game = @games[id]
      unless (@game_board_folder.can_fold_left?(game))
        return did_not_fold(game, id)
      end
      candidates = @candidate_translator.translate_left_fold(@candidate_extractor.fold_left_candidates(game))
      game = @game_board_folder.fold_left(game)
      prepare_for_next_fold(candidates, game, id)
    end

    def fold_down(id)
      game = @games[id]
      unless (@game_board_folder.can_fold_down?(game))
        return did_not_fold(game, id)
      end
      candidates = @candidate_translator.translate_down_fold(@candidate_extractor.fold_down_candidates(game))
      game = @game_board_folder.fold_down(game)
      prepare_for_next_fold(candidates, game, id)
    end

    def fold_up(id)
      game = @games[id]
      unless (@game_board_folder.can_fold_up?(game))
        return did_not_fold(game, id)
      end
      candidates = @candidate_translator.translate_up_fold(@candidate_extractor.fold_up_candidates(game))
      game = @game_board_folder.fold_up(game)
      prepare_for_next_fold(candidates, game, id)
    end

    def did_not_fold(game, id)
      respond_to_player(id, @next_number[id])
    end

    def prepare_for_next_fold(candidates, game, id)
      game = add_next_number(id, candidates, game)
      @next_number[id] = getNextNumber(game)
      @games[id] = game
      respond_to_player(id, @next_number[id])
    end

    def add_next_number(id, candidates, game)
      coordinates = @number_positioner.select_position(candidates)
      new_state = []
      game.row_vectors.each_index {|i|
        values = game.row_vectors[i].to_a
        if (coordinates[0] == i)
          values[coordinates[1]] = @next_number[id]
        end
        new_state << values
      }
      Matrix.rows(new_state)
    end

    def getNextNumber(game)
      @next_number_determinator.select_number(game)
    end

    def respond_to_player(id, next_number)
      {:id => id, :game => @games[id], :next_number => next_number, :game_over => @game_over_checker.game_over?(@games[id]), :score => ScoreCalculator.score_for(@games[id]) }
    end

  end

end
