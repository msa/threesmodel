require_relative "../lib/next_number_positioner"

describe NextNumberCandidateExtractor do

  before(:each) do
    @next_number_candidate_extractor = NextNumberCandidateExtractor.new
  end

  it "allows ones, twos and threes when game board is in initial state" do
    @number_adder.select_position([]).should eq({})
  end

end
