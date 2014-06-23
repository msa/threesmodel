# This class is responsible for selecting the number to add to a certain game
# board state and to select the cell where the number should go
class NextNumberPositioner

  # Selects one of the candidate positions to add the next number
  def select_position(candidates)
      return candidates[rand(0..candidates.size - 1)]
  end

end
