require_relative 'line_folder'
require "Matrix"
# A game board keeps and manipulates the state of the game.
class GameBoard

  def initialize
    @line_folder = LineFolder.new
  end

  # Sets the state of the game board in the form of a Matrix object.
  def state=(matrix)
    @state = matrix
  end

  # Gets the state of the game board in the form of a Matrix object.
  def state
    @state
  end

  # Folds the game board from right to left.
  def fold_left
    new_state = []
    @state.row_vectors.each {|row|
      values = row.to_a
      @line_folder.fold(values)
      new_state << values
    }
    @state = Matrix.rows(new_state)
  end

  # Folds the game board from left to right.
  def fold_right
    new_state = []
    @state.row_vectors.each {|row|
      values = row.to_a.reverse
      @line_folder.fold(values)
      new_state << values.reverse
    }
    @state = Matrix.rows(new_state)
  end

  # Folds the game board upwards.
  def fold_up
    new_state = []
    @state.column_vectors.each {|column|
      values = column.to_a
      @line_folder.fold(values)
      new_state << values
    }
    @state = Matrix.columns(new_state)
  end

  # Folds the game board downwards.
  def fold_down
    new_state = []
    @state.column_vectors.each {|column|
      values = column.to_a.reverse
      @line_folder.fold(values)
      new_state << values.reverse
    }
    @state = Matrix.columns(new_state)
  end

end
