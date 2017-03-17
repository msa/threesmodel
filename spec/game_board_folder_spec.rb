require_relative "../lib/game_board_folder"
require "Matrix"

describe GameBoardFolder do

  before(:each) do
    @game_board_folder = GameBoardFolder.new
  end

  it "can create game board" do
    expect(@game_board_folder).to_not eq(nil)
  end

  it "can fold all rows to the left" do
    expect(@game_board_folder.fold_left(
      Matrix.rows([[0,1,2,0],
                   [0,1,2,0],
                   [0,1,2,0],
                   [0,1,2,0]])).row(0).to_a).to eq([1,2,0,0])
  end

  it "can fold all rows to the right" do
    expect(@game_board_folder.fold_right(
      Matrix.rows([[0,1,2,0],
                   [0,1,2,0],
                   [0,1,2,0],
                   [0,1,2,0]])).row(0).to_a).to eq([0,0,1,2])
  end

  it "can fold all rows up" do
    state = @game_board_folder.fold_up(
      Matrix.rows([[0,0,0,0],
                   [1,1,1,1],
                   [2,2,2,2],
                   [0,0,0,0]]))
    expect(state.row(0).to_a).to eq([1,1,1,1])
    expect(state.row(1).to_a).to eq([2,2,2,2])
  end

  it "can fold all rows down" do
    state = @game_board_folder.fold_down(
      Matrix.rows([[0,0,0,0],
                   [1,1,1,1],
                   [2,2,2,2],
                   [0,0,0,0]]))
    expect(state.row(2).to_a).to eq([1,1,1,1])
    expect(state.row(3).to_a).to eq([2,2,2,2])
  end

  it "can not fold up when no columns can be folded" do
    state = @game_board_folder.can_fold_up?(
      Matrix.rows([[3,0,3,3],
                   [2,0,2,1],
                   [3,0,3,3],
                   [2,0,2,1]]))
    expect(state).to eq(false)
  end

end
