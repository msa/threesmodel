# The LineFolder can fold an array with four cells according to the rules of
# threes.
class LineFolder

  def initialize
    Array.class_eval do
      # Determines the "wall" position and the collapses the first to collapsible cells inserting a zero at the end. Assumes a foldable line.
      def squash
        array = Array.new(self)
        wall_index = wall_index_of
        array[wall_index] = array[wall_index] + array[wall_index + 1]
        while wall_index < 2
          array[wall_index + 1] = array[wall_index + 2]
          wall_index += 1
        end
        array[3] = 0
        return array
      end

      def wall_index_of
        return 0 if self[0] == 0
        return 0 if self[0] == 1 and self[1] == 2
        return 0 if self[0] == 2 and self[1] == 1
        if self[0] > 2
          return 0 if self[0] == self[1]
        end
        return 1 if self[1] == 0
        return 1 if (self[0] != self[1]) and self[1] == 1 and self[2] == 2
        return 1 if (self[0] != self[1]) and self[1] == 2 and self[2] == 1
        return 1 if (self[0] == self[1]) and self[1] == 1 and self[2] == 2
        return 1 if (self[0] == self[1]) and self[1] == 2 and self[2] == 1
        if self[1] > 2
          return 1 if self[1] == self[2]
        end
        return 2 if self[2] == 0
        return 2 if self[2] == 1 and self[3] == 2
        return 2 if self[2] == 2 and self[3] == 1
        if self[2] > 2
          return 2 if self[2] == self[3]
        end
      end

    end
  end

  def fold(line)
    if can_fold?(line) then
      if(line == [0,0,0,0]) then return line end
      return line.squash
    else
      return line
    end
  end

  def can_fold?(line)
    foldable = has_adjacent_one_and_two?(line)
    foldable = (foldable or has_adjacent_equals?(line))
    foldable = (foldable or has_non_trailing_zeros?(line))
    return foldable
  end

  def has_non_trailing_zeros?(line)
    first_non_zero_from_end = index_of_first_non_trailing_zero(line)
    if (first_non_zero_from_end == nil) then return true end
    if (line.index(0) == nil) then return false end
    return (line.index(0) < first_non_zero_from_end)
  end

  def index_of_first_non_trailing_zero(line)
    first_non_zero_from_end = line.rindex {|element| element != 0}
  end

  def has_adjacent_one_and_two?(line)
    pairs = line.each_cons(2).to_a
    index = pairs.each_index {|i|
      if (pairs[i].sort == [1, 2])
        return true
      end
    }
    false
  end

  def has_adjacent_equals?(line)
    pairs = line.each_cons(2).to_a
    index = pairs.each {|pair|
      if(pair[0] == pair[1] and (pair[0] > 2))
        return true
      end
    }
    false
  end

end
