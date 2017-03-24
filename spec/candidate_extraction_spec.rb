require "threesmodel/candidate_extractor"

describe CandidateExtractor do

  before(:each) do
    @candidate_extractor = CandidateExtractor.new
  end

  it "extracts no candidates form an unfoldable board" do
    game = Matrix.rows([[3, 1, 1, 3],
                               [6, 1, 1, 6],
                               [12, 1, 3, 12],
                               [24, 1, 6, 24]])
    expect(@candidate_extractor.fold_left_candidates(game)).to eq([])
    expect(@candidate_extractor.fold_right_candidates(game)).to eq([])
    expect(@candidate_extractor.fold_up_candidates(game)).to eq([])
    expect(@candidate_extractor.fold_down_candidates(game)).to eq([])
  end

  it "extracts a single candidate form a board with one foldable line" do
    expect(@candidate_extractor.fold_left_candidates(
      Matrix.rows([[3,1,1,3],[6,1,1,6],[12,1,2,12],[24,1,6,24]]))).to eq([[2,3]])
  end

  it "extracts all four candidates form a board where all lines fold" do
    expect(@candidate_extractor.fold_left_candidates(
      Matrix.rows([[3,3,1,3],
                   [6,3,3,6],
                   [12,1,12,12],
                   [3,3,3,3]]))).to eq([[0,3], [1,3], [2,3], [3,3]])
  end

end
