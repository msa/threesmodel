# This class is responsible for selecting the number to add to a certain game
# board state and to select the cell where the number should go
class NextNumberPositioner

  def next_number=(number)
    @next = number
  end

  def select_position(candidates)
    if candidates == [] then
      return {}
    end
      return {candidates[rand(0..candidates.size - 1)] => @next}
  end

end
