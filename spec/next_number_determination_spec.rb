require_relative "../lib/next_number_determinator"
require_relative "custom_matchers"

describe NextNumberDeterminator do

  include CustomMatchers

  before(:each) do
    @next_number_determinator = NextNumberDeterminator.new
  end


  it "allows ones, twos and threes when game board is in initial state" do
    expect(@next_number_determinator.select_number(
      Matrix.rows([[1,3,0,0],
                   [2,0,3,2],
                   [0,0,3,1],
                   [2,0,0,3]]))).to be_one_of([1, 2, 3])
  end

  it "can determine the highest number on the board" do
    expect(@next_number_determinator.highest_number(
      Matrix.rows([[ 1,48,0,0],
                   [24, 0,3,2],
                   [ 0, 0,3,1],
                   [ 2, 0,0,3]]))).to eq(48)
  end


  it "allows all but the two highest numbers for boards with higher numbers" do
    expect(@next_number_determinator.select_number(
      Matrix.rows([[ 1,48,0,0],
                   [24, 0,3,2],
                   [ 0, 0,3,1],
                   [ 2, 0,0,3]]))).to be_one_of([1, 2, 3, 6, 12])
  end

end
