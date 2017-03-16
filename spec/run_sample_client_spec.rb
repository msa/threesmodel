require_relative "../lib/sample_automated_player"

describe SampleAutomatedPlayer do
  it "will run a hundred times" do
    player = SampleAutomatedPlayer.new
    player.play_many(10)
  end
end
