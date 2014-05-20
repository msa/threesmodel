require_relative 'line_folder'
require "Matrix"
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
      @line_folder.fold(values)
      new_state << values
    }
    Matrix.rows(new_state)
  end

  # Folds the game board from left to right.
  def fold_right(state)
    new_state = []
    state.row_vectors.each {|row|
      values = row.to_a.reverse
      @line_folder.fold(values)
      new_state << values.reverse
    }
    Matrix.rows(new_state)
  end

  # Folds the game board upwards.
  def fold_up(state)
    new_state = []
    state.column_vectors.each {|column|
      values = column.to_a
      @line_folder.fold(values)
      new_state << values
    }
    Matrix.columns(new_state)
  end

  # Folds the game board downwards.
  def fold_down(state)
    new_state = []
    state.column_vectors.each {|column|
      values = column.to_a.reverse
      @line_folder.fold(values)
      new_state << values.reverse
    }
    Matrix.columns(new_state)
  end

end
