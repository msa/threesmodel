require_relative "../lib/next_number_positioner"
require_relative "custom_matchers"

describe NextNumberPositioner do

  include CustomMatchers

  before(:each) do
    @number_adder = NextNumberPositioner.new
    @number_adder.next_number= 3
  end

  it "does not add a number when game board has not folded" do
    @number_adder.select_position([]).should eq({})
  end

  it "will always add to the one cell provided" do
    @number_adder.select_position(["0:1"]).should eq({"0:1" => 3})
  end

  it "will always return one element when given more candidates" do
    @number_adder.select_position(["0:0", "0:1"]).size.should eq(1)
    @number_adder.select_position(["0:0", "0:1", "0:2"]).size.should eq(1)
    @number_adder.select_position(["0:0", "0:1", "0:2", "0:3"]).size.should eq(1)
  end

  it "will always return a valid candidate" do
    @number_adder.select_position(["0:0", "0:1"]).should be_one_of(["0:0", "0:1"])
    @number_adder.select_position(["0:0", "0:1", "0:2"]).should be_one_of(["0:0", "0:1", "0:2"])
    @number_adder.select_position(["0:0", "0:1", "0:2", "0:3"]).should be_one_of(["0:0", "0:1", "0:2", "0:3"])
  end
end
