require_relative 'line_folder'
# A game board keeps and manipulates the state of the game.
class GameBoardFolder

  def initialize(line_folder = LineFolder.new )
    @line_folder = line_folder
  end

  # Folds the game board from right to left.
  def fold_left(state)
    new_state = []
    state.row_vectors.each_index {|i|
      values = state.row_vectors[i].to_a
      values = @line_folder.fold(values)
      new_state << values
    }
    Matrix.rows(new_state)
  end

  # Folds the game board from left to right.
  def fold_right(state)
    new_state = []
    state.row_vectors.each {|row|
      values = row.to_a.reverse
      values = @line_folder.fold(values)
      new_state << values.reverse
    }
    Matrix.rows(new_state)
  end

  # Folds the game board upwards.
  def fold_up(state)
    new_state = []
    state.column_vectors.each {|column|
      values = column.to_a
      values = @line_folder.fold(values)
      new_state << values
    }
    Matrix.columns(new_state)
  end

  # Folds the game board downwards.
  def fold_down(state)
    new_state = []
    state.column_vectors.each {|column|
      values = column.to_a.reverse
      values = @line_folder.fold(values)
      new_state << values.reverse
    }
    Matrix.columns(new_state)
  end

  def can_fold_left?(state)
    foldable = false
    state.row_vectors.each{|line|
      foldable = (foldable or @line_folder.can_fold?(line.to_a))
    }
    foldable
  end

  def can_fold_right?(state)
    foldable = false
    state.row_vectors.each{|line|
      foldable = (foldable or @line_folder.can_fold?(line.to_a.reverse))
    }
    foldable
  end

  def can_fold_up?(state)
    foldable = false
    state.column_vectors.each{|line|
      foldable = (foldable or @line_folder.can_fold?(line.to_a))
    }
    foldable
  end

  def can_fold_down?(state)
    foldable = false
    state.column_vectors.each{|line|
      foldable = (foldable or @line_folder.can_fold?(line.to_a.reverse))
    }
    foldable
  end

end
