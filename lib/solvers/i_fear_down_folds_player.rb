require 'threesmodel'

class IFearDownFoldsPlayer < Threesmodel::BaseGameAutomation

  def play
    while (not @game[:game_over]) do

      if (@game_board_folder.can_fold_up?(@game[:game]) or @game_board_folder.can_fold_left?(@game[:game]) or @game_board_folder.can_fold_right?(@game[:game])) then
        @game_controller.fold_up(@game[:id])
        @game_controller.fold_right(@game[:id])
        @game = @game_controller.fold_left(@game[:id])
      else
        @game = @game_controller.fold_down(@game[:id])
      end

    end
    @game[:score]
  end

end
