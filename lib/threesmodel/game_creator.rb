class GameCreator
  def self.create_new_game
    positions = random_positions(9)
    create_matrix(positions)
  end

  def self.create_matrix(positions)
    rows = []
    4.times {
      rows << [0,0,0,0]
    }
    positions.each {|position|
      rows[position[0]][position[1]] = rand(1..3)
    }
    Matrix.rows(rows)
  end

  def self.random_positions(number_of_positions)
    positions = []
    while (positions.length < number_of_positions)
      candidate_position = [rand(0..3), rand(0..3)]
      unless positions.include?(candidate_position)
        positions << candidate_position
      end
    end
    positions
  end
end
