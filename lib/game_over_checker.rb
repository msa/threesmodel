require_relative 'line_folder'
class GameOverChecker

  def initialize
    @line_folder = LineFolder.new
  end

  def game_over?(state)
    state.row_vectors.each {|row|
      if ((@line_folder.can_fold?(row.to_a)) or (@line_folder.can_fold?(row.to_a.reverse))) then return false end
    }
    state.column_vectors.each{|column|
      if ((@line_folder.can_fold?(column.to_a)) or (@line_folder.can_fold?(column.to_a.reverse))) then return false end
    }
    true
  end

end
