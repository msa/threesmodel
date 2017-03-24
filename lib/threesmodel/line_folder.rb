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
        return 3 if self == ([1,1,1,1] or [2,2,2,2])
        return 3 if self[1..3] == [0,0,0]
        return 0 if self[0] == 0
        return 0 if self[0] == 1 and self[1] == 2
        return 0 if self[0] == 2 and self[1] == 1
        if self[0] > 2
          return 0 if self[0] == self[1]
        end
        return 3 if self[2..3] == [0,0]
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
        3
      end

    end
  end

  def fold(line)
    if can_fold?(line) then
      return line.squash
    else
      return line
    end
  end

  def can_fold?(line)
    return line.wall_index_of < 3
  end

end
