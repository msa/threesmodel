require_relative "../lib/candidate_extractor"
require "Matrix"

describe CandidateExtractor do

  before(:each) do
    @candidate_extractor = CandidateExtractor.new
  end

  it "extracts no candidates form an unfoldable board" do
    game = Matrix.rows([[3, 1, 1, 3],
                               [6, 1, 1, 6],
                               [12, 1, 3, 12],
                               [24, 1, 6, 24]])
    @candidate_extractor.fold_left_candidates(
        game).should eq([])
    @candidate_extractor.fold_right_candidates(
        game).should eq([])
    @candidate_extractor.fold_up_candidates(
        game).should eq([])
    @candidate_extractor.fold_down_candidates(
        game).should eq([])
  end

  it "extracts a single candidate form a board with one foldable line" do
    @candidate_extractor.fold_left_candidates(
      Matrix.rows([[3,1,1,3],
                   [6,1,1,6],
                   [12,1,2,12],
                   [24,1,6,24]])).should eq([[2,3]])
  end

  it "extracts all four candidates form a board where all lines fold" do
    @candidate_extractor.fold_left_candidates(
      Matrix.rows([[3,3,1,3],
                   [6,3,3,6],
                   [12,1,12,12],
                   [3,3,3,3]])).should eq([[0,3], [1,3], [2,3], [3,3]])
  end

end
