require_relative "../lib/next_number_determinator"
require_relative "custom_matchers"

describe NextNumberDeterminator do

  include CustomMatchers

  before(:each) do
    @next_number_determinator = NextNumberDeterminator.new
  end


  it "allows ones, twos and threes when game board is in initial state" do
    @next_number_determinator.select_number(
      Matrix.rows([[1,3,0,0],
                   [2,0,3,2],
                   [0,0,3,1],
                   [2,0,0,3]])).should eq(1)
  end

end
