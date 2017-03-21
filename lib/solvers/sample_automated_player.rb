require 'threesmodel'
require 'histogram/array'
require_relative 'base_game_automation'

class SampleAutomatedPlayer < BaseGameAutomation

  def play
    while (not @game[:game_over]) do
      @game_controller.fold_right(@game[:id])
      @game_controller.fold_up(@game[:id])
      @game_controller.fold_left(@game[:id])
      @game = @game_controller.fold_down(@game[:id])
    end
    @game[:score]
  end

end
