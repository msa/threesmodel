# This class is responsible for calculating the score for a given game board.
class ScoreCalculator

    @@score_table = {0 => 0, 1 => 0, 2 => 0,
                   3 => 3, 6 => 9,
                   12 => 27,
                   24 => 81,
                   48 => 243,
                   96 => 729,
                   192 => 2187,
                   384 => 6561,
                   768 => 19683,
                   1536 => 59049,
                   3072 => 177147,
                   6144 => 531441}

  def self.score_for(game_board)
    score = 0
    game_board.row_vectors.each {|vector|
      vector.to_a.each {|val|
        score = score + @@score_table[val]
      }
    }
    score
  end

end
