require_relative "../lib/game_board"
require "Matrix"

describe GameBoard do

  it "can create game board" do
    game_board = GameBoard.new
    game_board.should_not eq(nil)
  end

  it "can fold all rows to the left" do
    game_board = GameBoard.new
    game_board.state = Matrix.rows([[0,1,2,0],
                                    [0,1,2,0],
                                    [0,1,2,0],
                                    [0,1,2,0]])
    game_board.fold_left
    game_board.state.row(0).to_a.should eq([1,2,0,0])
  end

  it "can fold all rows to the right" do
    game_board = GameBoard.new
    game_board.state = Matrix.rows([[0,1,2,0],
                                  [0,1,2,0],
                                  [0,1,2,0],
                                  [0,1,2,0]])
    game_board.fold_right
    game_board.state.row(0).to_a.should eq([0,0,1,2])
  end

  it "can fold all rows up" do
    game_board = GameBoard.new
    game_board.state = Matrix.rows([[0,0,0,0],
                                   [1,1,1,1],
                                   [2,2,2,2],
                                   [0,0,0,0]])
    game_board.fold_up
    game_board.state.row(0).to_a.should eq([1,1,1,1])
    game_board.state.row(1).to_a.should eq([2,2,2,2])
  end

  it "can fold all rows down" do
    game_board = GameBoard.new
    game_board.state = Matrix.rows([[0,0,0,0],
                                   [1,1,1,1],
                                   [2,2,2,2],
                                   [0,0,0,0]])
    game_board.fold_down
    game_board.state.row(2).to_a.should eq([1,1,1,1])
    game_board.state.row(3).to_a.should eq([2,2,2,2])
  end

end
