class CandidateExtractor

  def initialize(line_folder = LineFolder.new )
    @line_folder = line_folder
  end

  def extract_candidates(state)
    candidates = []
    state.row_vectors.each_index {|i|
      values = state.row_vectors[i].to_a
      if (@line_folder.can_fold?(values)) then candidates << [i,3] end
    }
    candidates
  end
end
