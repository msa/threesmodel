require 'line_folder'
class CandidateExtractor

  def initialize(line_folder = LineFolder.new)
    @line_folder = line_folder
  end

  def fold_left_candidates(state)
    candidates = []
    state.row_vectors.each_index {|i|
      add_candidate(candidates, i, state.row_vectors[i].to_a)
    }
    candidates
  end

  def fold_right_candidates(state)
    candidates = []
    state.row_vectors.each_index {|i|
      add_candidate(candidates, i, state.row_vectors[i].to_a.reverse)
    }
    candidates
  end

  def fold_up_candidates(state)
    candidates = []
    state.column_vectors.each_index {|i|
      add_candidate(candidates, i, state.column_vectors[i].to_a)
    }
    candidates
  end

  def fold_down_candidates(state)
    candidates = []
    state.column_vectors.each_index {|i|
      add_candidate(candidates, i, state.column_vectors[i].to_a.reverse)
    }
    candidates
  end

  def add_candidate(candidates, index, values)
    if (@line_folder.can_fold?(values)) then
      candidates << [index, 3]
    end
  end


end
