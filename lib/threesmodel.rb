require "threesmodel/version"
require 'candidate_translator'
require 'candidate_extractor'
require 'game_board_folder'
require 'next_number_positioner'
require 'next_number_determinator'
require 'game_over_checker'
require 'game_creator'
require 'securerandom'
require 'matrix'

module Threesmodel


  class GameController

    def initialize
      @games = {}
      @next_number = {}
    end

    def start_new_game
      @candidate_extractor = CandidateExtractor.new
      @candidate_translator = CandidateTranslator.new
      @game_over_checker = GameOverChecker.new
      @next_number_determinator = NextNumberDeterminator.new
      @number_positioner = NextNumberPositioner.new
      @game_board_folder = GameBoardFolder.new
      id = SecureRandom.uuid
      @games[id] = GameCreator.create_new_game()
      @next_number[id] = getNextNumber(@games[id])
      respond_to_player(id, @next_number[id])
    end

    def fold_right(id)
      game = @games[id]
      unless (@game_board_folder.can_fold_right?(game))
        puts "Foldable: #{@game_board_folder.can_fold_right?(game)} - bailing out!"
        return did_not_fold(game, id)
      end
      candidates = @candidate_translator.translate_right_fold(@candidate_extractor.fold_right_candidates(game))
      game = @game_board_folder.fold_right(game)
      prepare_for_next_fold(candidates, game, id)
    end

    def fold_left(id)
      game = @games[id]
      unless (@game_board_folder.can_fold_left?(game))
        puts "unable to fold - bailing out!"
        return did_not_fold(game, id)
      end
      candidates = @candidate_translator.translate_left_fold(@candidate_extractor.fold_left_candidates(game))
      game = @game_board_folder.fold_left(game)
      prepare_for_next_fold(candidates, game, id)
    end

    def fold_down(id)
      game = @games[id]
      unless (@game_board_folder.can_fold_down?(game))
        puts "unable to fold - bailing out!"
        return did_not_fold(game, id)
      end
      candidates = @candidate_translator.translate_down_fold(@candidate_extractor.fold_down_candidates(game))
      game = @game_board_folder.fold_down(game)
      prepare_for_next_fold(candidates, game, id)
    end

    def fold_up(id)
      game = @games[id]
      unless (@game_board_folder.can_fold_up?(game))
        puts "unable to fold - bailing out!"
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
          values[coordinates[0]] = @next_number[id]
        end
        new_state << values
      }
      Matrix.rows(new_state)
    end

    def getNextNumber(game)
      @next_number_determinator.select_number(game)
    end

    def respond_to_player(id, next_number)
      {"id" => id, "game" => @games[id], "next_number" => next_number, "game_over" => @game_over_checker.game_over?(@games[id])}
    end

  end

end
