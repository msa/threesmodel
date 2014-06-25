require_relative "../lib/next_number_positioner"
require_relative "custom_matchers"

describe NextNumberPositioner do

  include CustomMatchers

  before(:each) do
    @number_adder = NextNumberPositioner.new
  end

  it "will always add to the one cell provided" do
    @number_adder.select_position([[0,1]]).should eq([0,1])
  end

  it "will always return one element when given more candidates" do
    #Since it returns one of the encapsulated lists the size should be 2
    @number_adder.select_position([[0,0], [0,1]]).size.should eq(2)
    @number_adder.select_position([[0,0], [0,1], [0,2]]).size.should eq(2)
    @number_adder.select_position([[0,0], [0,1], [0,2], [0,3]]).size.should eq(2)
  end

  it "will always return a valid candidate" do
    @number_adder.select_position([[0,0], [0,1]]).should be_one_of([[0,0], [0,1]])
    @number_adder.select_position([[0,0], [0,1], [0,2]]).should be_one_of([[0,0], [0,1], [0,2]])
    @number_adder.select_position([[0,0], [0,1], [0,2], [0,3]]).should be_one_of([[0,0], [0,1], [0,2], [0,3]])
  end
end
