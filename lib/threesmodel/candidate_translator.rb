class CandidateTranslator

  def translate_left_fold(candidates)
    candidates
  end

  def translate_right_fold(candidates)
    translate(candidates, {[0,3] => [3,0], [1,3] => [2,0], [2,3] => [1,0], [3,3] => [0,0]})
  end

  def translate_down_fold(candidates)
    translate(candidates, {[0,3] => [0,0], [1,3] => [0,1], [2,3] => [0,2], [3,3] => [0,3]})
  end

  def translate_up_fold(candidates)
    translate(candidates, {[0,3] => [3,3], [1,3] => [3,2], [2,3] => [3,1], [3,3] => [3,0]})
  end

  def translate(candidates, translation)
    result = []
    for candidate in candidates do
      result << translation[candidate]
    end
    result
  end
end
