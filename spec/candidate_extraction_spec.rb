require_relative "../lib/game_board"
require "Matrix"

describe GameBoard do

  before(:each) do
    @game_board = GameBoard.new
  end

  it "extracts no candidates form an unfoldable board" do
    @game_board.state = Matrix.rows([[3,1,1,3],
                                    [6,1,1,6],
                                    [12,1,3,12],
                                    [24,1,6,24]])
    @game_board.fold_left
    @game_board.candidates.should eq([])
  end

  it "extracts a single candidate form a board with one foldable line" do
    @game_board.state = Matrix.rows([[3,1,1,3],
                                    [6,1,1,6],
                                    [12,1,2,12],
                                    [24,1,6,24]])
    @game_board.fold_left
    @game_board.candidates.should eq(["2:3"])
  end

  it "extracts all four candidates form a board where all lines fold" do
    @game_board.state = Matrix.rows([[3,3,1,3],
                                    [6,3,3,6],
                                    [12,1,12,12],
                                    [3,3,3,3]])
    @game_board.fold_left
    @game_board.candidates.should eq(["0:3", "1:3", "2:3", "3:3"])
  end

end
