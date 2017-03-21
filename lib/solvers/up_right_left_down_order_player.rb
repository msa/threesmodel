require 'threesmodel'
require_relative 'base_game_automation'

class UpRightLeftDownOrderPlayer < BaseGameAutomation

  def play
    while (not @game[:game_over]) do
      if @game_board_folder.can_fold_up?(@game[:game])
        @game = @game_controller.fold_up(@game[:id])
      elsif @game_board_folder.can_fold_right?(@game[:game])
        @game = @game_controller.fold_right(@game[:id])
      elsif @game_board_folder.can_fold_left?(@game[:game])
        @game = @game_controller.fold_left(@game[:id])
      else
        @game = @game_controller.fold_down(@game[:id])
      end
    end
    @game[:score]
  end

end
