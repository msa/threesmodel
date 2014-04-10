# The LineFolder can fold an array with four cells according to the rules of
# threes.
class LineFolder

  def initialize
    Array.class_eval do
      def squash
        first_non_zero_from_end = self.rindex {|element|
            element != 0
        }
        first_zero = self.index(0)
        if ((first_zero != nil) and (first_zero < first_non_zero_from_end))
          self.delete_at(self.index(0))
          self << 0
          return self
        end
        pairs = self.each_cons(2).to_a
        index = pairs.each_index {|i|
            if ((pairs[i].sort == [1, 2]) or (pairs[i][0] == pairs[i][1] and (pairs[i][0] > 2)))
              self[i] = pairs[i].inject{|sum,x| sum + x }
              self.delete_at(i + 1)
              self << 0
              break
            end
        }
        self
      end
    end
  end

  def fold(line)
    if can_fold?(line) then
      if(line == [0,0,0,0]) then return line end
      line.squash
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
