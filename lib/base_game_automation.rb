require_relative 'game_board_folder'

class BaseGameAutomation
  def initialize
    @game_controller = Threesmodel::GameController.new
    @game_board_folder = GameBoardFolder.new
    @scores = []
    @best_game = nil
  end

  def play;
    raise 'Method missing - please implement "play" method.';
  end

  def play_many(times=100)
    max_score = 0
    times.times do
      @game = @game_controller.start_new_game
      score = play
      if score > max_score then
          max_score = score
          @best_game = @game[:game]
      end
      @scores << score
      print "."
    end
    puts max_score
    (bins, freqs) = @scores.histogram
    puts freqs
    File.open("scores.txt", "w+") do |f|
      f.puts(@scores)
    end

    puts "Best game is:"
    puts @best_game
  end

end
