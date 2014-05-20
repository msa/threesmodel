# This class is responsible for selecting the number to add to a certain game
# board state and to select the cell where the number should go
class NextNumberPositioner

  def initialize
    @candidates = []
  end

  def next_number=(number)
    @next = number
  end

  # Assumes the values are in the order of the "reverse" fold hence
  # new values are always added in the last column (3).
  def extract_candidates(values)
    if line_folder.can_fold?(values) then @candidates << "#{i}:#{3}" end
  end

  def add_next_number

  end

  # Given the assigned next number value it returns the coordinates and the
  # next value to be added positions the
  def select_position(candidates)
    if candidates == [] then
      return {}
    end
      return {candidates[rand(0..candidates.size - 1)] => @next}
  end

end
