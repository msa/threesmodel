require "solvers/sample_automated_player"
require "solvers/i_fear_down_folds_player"
require "solvers/up_right_left_down_order_player"
require "solvers/highest_paying_next_move_player"

describe SampleAutomatedPlayer do
  it "runs the sample automated player" do
    player = SampleAutomatedPlayer.new
    player.play_many(50)
  end

  it "runs the player that tries to avoid down folds" do
      player = IFearDownFoldsPlayer.new
      player.play_many(50)
  end

  it "runs the player that tries to fold up right" do
      player = UpRightLeftDownOrderPlayer.new
      player.play_many(50)
  end

  it "runs the player that goes with the highest paying next move" do
    player = HighestPayingNextMovePlayer.new
    player.play_many(50)
  end

end
