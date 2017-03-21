require 'threesmodel'
require_relative 'base_game_automation'
require 'game_board_folder'
require 'score_calculator'

class HighestPayingNextMovePlayer < BaseGameAutomation
  FOLDER = GameBoardFolder.new
  def play
    while (not @game[:game_over]) do
      possible_moves = [:fold_right, :fold_left, :fold_up, :fold_down]
      possible_moves.select! do |move|
        FOLDER.send("can_#{move.to_s}?".to_sym, @game[:game])
      end

      scored_moves = possible_moves.map do |move|
        [move, ScoreCalculator.score_for(FOLDER.send(move, @game[:game]))]
      end

      new_move = scored_moves.max{ |a, b| a[1] <=> b[1] }[0]
      @game = @game_controller.send(new_move, @game[:id])
    end
    @game[:score]
  end
end