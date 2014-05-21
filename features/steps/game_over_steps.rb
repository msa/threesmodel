require 'Matrix'
require_relative '../../lib/game_over_checker'

Before do
  @game_over_checker = GameOverChecker.new
end

Given(/^an unfoldable game board$/) do
  matrix = [[3,6,3,6],[6,3,6,3],[3,6,3,6],[6,3,6,3]]
  @state = Matrix.rows(matrix)
end

Then(/^the game is over$/) do
  @game_over_checker.game_over?(@state).should == true
end

Given(/^a foldable game board$/) do
  matrix = [[3,3,3,3],[3,3,3,3],[3,3,3,3],[3,3,3,3]]
  @state = Matrix.rows(matrix)
end

Then(/^the game continues$/) do
  @game_over_checker.game_over?(@state).should == false
end
