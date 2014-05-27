class NextNumberDeterminator
  def initialize
    @score_table = [0,1,2,3,6,12,24,48,96,192,384,768,1536,3072,6144]
  end

  def highest_number(game_board)
    highest = 0
    game_board.row_vectors.each {|row|
      row.to_a.each {|value|
        if (value > highest) then
          highest = value
        end
      }
    }
    return highest
  end

  def select_number(game_board)
    return 1
  end
end
