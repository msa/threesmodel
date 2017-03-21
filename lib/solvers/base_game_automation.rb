require 'game_board_folder'

class BaseGameAutomation
  def initialize
    @game_controller = Threesmodel::GameController.new
    @game_board_folder = GameBoardFolder.new
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
