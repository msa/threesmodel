require_relative '../lib/candidate_translator'
describe CandidateTranslator do

  it "translates left fold candidates with same candidates" do
    translator = CandidateTranslator.new
    translator.translate_left_fold([[0,3]]).should eq [[0,3]]
    translator.translate_left_fold([[0,3], [1,3]]).should eq [[0,3], [1,3]]
    translator.translate_left_fold([[0,3], [1,3], [2,3]]).should eq [[0,3], [1,3], [2,3]]
    translator.translate_left_fold([[0,3], [1,3], [2,3], [3,3]]).should eq [[0,3], [1,3], [2,3], [3,3]]
  end

  it "translates right fold candidates with mirrored candidates" do
    translator = CandidateTranslator.new
    translator.translate_right_fold([[0,3]]).should eq [[3,0]]
    translator.translate_right_fold([[1,3]]).should eq [[2,0]]
    translator.translate_right_fold([[2,3]]).should eq [[1,0]]
    translator.translate_right_fold([[3,3]]).should eq [[0,0]]
  end

  it "translates down fold candidates" do
    translator = CandidateTranslator.new
    translator.translate_down_fold([[0,3]]).should eq [[0,0]]
    translator.translate_down_fold([[1,3]]).should eq [[0,1]]
    translator.translate_down_fold([[2,3]]).should eq [[0,2]]
    translator.translate_down_fold([[3,3]]).should eq [[0,3]]
  end

  it "translates up fold candidates" do
    translator = CandidateTranslator.new
    translator.translate_up_fold([[0,3]]).should eq [[3,3]]
    translator.translate_up_fold([[1,3]]).should eq [[3,2]]
    translator.translate_up_fold([[2,3]]).should eq [[3,1]]
    translator.translate_up_fold([[3,3]]).should eq [[3,0]]
  end

end
