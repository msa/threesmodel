require_relative '../../lib/threesmodel'

Before do
end

Given(/^a new game is started$/) do
   @game_controller = Threesmodel::GameController.new
   @game_state = @game_controller.start_new_game
end

Then(/^an id is attached to the game$/) do
  @game_state["id"].should_not == nil
end

Then(/^the game is not over$/) do
  @game_state["game_over"].should_not == true
end

Then(/^the game board has (\d+) cells filled$/) do |filled_cells|
  c = []
  values = @game_state["game"].row_vectors.each{|row|
    c << row.to_a
  }
  c.flatten!
  d = c.find_all{|item| item > 0}
  d.size.should eq(9)
end

Then(/^the board contains no other but the following numbers:$/) do |table|
  data = table.raw[0]
  c = []
  values = @game_state["game"].row_vectors.each{|row|
    c << row.to_a
  }
  c.flatten!.uniq!
  data.each{|value|
    c.include?(value.to_i).should eq(true)
  }
end

