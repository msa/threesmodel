require_relative "../lib/game_board_folder"
require "Matrix"

describe GameBoardFolder do

  before(:each) do
    @game_board_folder = GameBoardFolder.new
  end

  it "can create game board" do
    @game_board_folder.should_not eq(nil)
  end

  it "can fold all rows to the left" do
    @game_board_folder.fold_left(
      Matrix.rows([[0,1,2,0],
                   [0,1,2,0],
                   [0,1,2,0],
                   [0,1,2,0]])).row(0).to_a.should eq([1,2,0,0])
  end

  it "can fold all rows to the right" do
    @game_board_folder.fold_right(
      Matrix.rows([[0,1,2,0],
                   [0,1,2,0],
                   [0,1,2,0],
                   [0,1,2,0]])).row(0).to_a.should eq([0,0,1,2])
  end

  it "can fold all rows up" do
    state = @game_board_folder.fold_up(
      Matrix.rows([[0,0,0,0],
                   [1,1,1,1],
                   [2,2,2,2],
                   [0,0,0,0]]))
    state.row(0).to_a.should eq([1,1,1,1])
    state.row(1).to_a.should eq([2,2,2,2])
  end

  it "can fold all rows down" do
    state = @game_board_folder.fold_down(
      Matrix.rows([[0,0,0,0],
                   [1,1,1,1],
                   [2,2,2,2],
                   [0,0,0,0]]))
    state.row(2).to_a.should eq([1,1,1,1])
    state.row(3).to_a.should eq([2,2,2,2])
  end

end
