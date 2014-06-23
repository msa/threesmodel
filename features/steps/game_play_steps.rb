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

end

Then(/^the board contains no other but the following numbers:$/) do |table|
  # table is a Cucumber::Ast::Table

end

