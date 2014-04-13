# This class is responsible for selecting the number to add to a certain game
# board state and to select the cell where the number should go
class NumberAdder

  def next_number=(number)
    @next = number
  end

  def add(line)
    if line == [] then
      return {}
    end
      return {line[rand(0..line.size - 1)] => @next}
  end

end
