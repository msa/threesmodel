require_relative '../lib/candidate_translator'
describe CandidateTranslator do

  it "translates left fold candidates with same candidates" do
    translator = CandidateTranslator.new
    expect(translator.translate_left_fold([[0,3]])).to eq [[0,3]]
    expect(translator.translate_left_fold([[0,3], [1,3]])).to eq [[0,3], [1,3]]
    expect(translator.translate_left_fold([[0,3], [1,3], [2,3]])).to eq [[0,3], [1,3], [2,3]]
    expect(translator.translate_left_fold([[0,3], [1,3], [2,3], [3,3]])).to eq [[0,3], [1,3], [2,3], [3,3]]
  end

  it "translates right fold candidates with mirrored candidates" do
    translator = CandidateTranslator.new
    expect(translator.translate_right_fold([[0,3]])).to eq [[3,0]]
    expect(translator.translate_right_fold([[1,3]])).to eq [[2,0]]
    expect(translator.translate_right_fold([[2,3]])).to eq [[1,0]]
    expect(translator.translate_right_fold([[3,3]])).to eq [[0,0]]
  end

  it "translates down fold candidates" do
    translator = CandidateTranslator.new
    expect(translator.translate_down_fold([[0,3]])).to eq [[0,0]]
    expect(translator.translate_down_fold([[1,3]])).to eq [[0,1]]
    expect(translator.translate_down_fold([[2,3]])).to eq [[0,2]]
    expect(translator.translate_down_fold([[3,3]])).to eq [[0,3]]
  end

  it "translates up fold candidates" do
    translator = CandidateTranslator.new
    expect(translator.translate_up_fold([[0,3]])).to eq [[3,3]]
    expect(translator.translate_up_fold([[1,3]])).to eq [[3,2]]
    expect(translator.translate_up_fold([[2,3]])).to eq [[3,1]]
    expect(translator.translate_up_fold([[3,3]])).to eq [[3,0]]
  end

end
