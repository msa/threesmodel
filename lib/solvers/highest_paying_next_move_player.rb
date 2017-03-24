require 'threesmodel'

class HighestPayingNextMovePlayer < Threesmodel::BaseGameAutomation
  def play
    while (not @game[:game_over]) do
      possible_moves = [:fold_right, :fold_left, :fold_up, :fold_down]
      possible_moves.select! do |move|
        @game_board_folder.send("can_#{move.to_s}?".to_sym, @game[:game])
      end

      scored_moves = possible_moves.map do |move|
        [move, @score_calculator.score_for(@game_board_folder.send(move, @game[:game]))]
      end
      new_move = scored_moves.max{ |a, b| a[1] <=> b[1] }[0]
      @game = @game_controller.send(new_move, @game[:id])
    end
    @game[:score]
  end
end
