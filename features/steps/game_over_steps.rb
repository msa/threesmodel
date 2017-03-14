require 'Matrix'
require_relative '../../lib/game_over_checker'

Before do
  @game_over_checker = GameOverChecker.new
end

Given(/^an unfoldable game board$/) do
  matrix = [[3,6,3,6],[6,3,6,3],[3,6,3,6],[6,3,6,3]]
  @state = Matrix.rows(matrix)
end

Given(/^a game board that only folds left and up$/) do
  matrix = [[0,6,3,6],[6,3,6,3],[3,6,3,6],[6,3,6,3]]
  @state = Matrix.rows(matrix)
end

Given(/^a game board that only folds left and down$/) do
  matrix = [[3,6,3,6],[6,3,6,3],[3,6,3,6],[0,3,6,3]]
  @state = Matrix.rows(matrix)
end

Given(/^a game board that only folds right and up$/) do
  matrix = [[3,6,3,0],[6,3,6,3],[3,6,3,6],[6,3,6,3]]
  @state = Matrix.rows(matrix)
end

Given(/^a game board that only folds right and down$/) do
  matrix = [[3,6,3,6],[6,3,6,3],[3,6,3,6],[6,3,6,0]]
  @state = Matrix.rows(matrix)
end

Then(/^the game is over$/) do
  expect(@game_over_checker.game_over?(@state)).to eq(true)
end

Given(/^a foldable game board$/) do
  matrix = [[3,3,3,3],[3,3,3,3],[3,3,3,3],[3,3,3,3]]
  @state = Matrix.rows(matrix)
end

Then(/^the game continues$/) do
  expect(@game_over_checker.game_over?(@state)).to eq(false)
end
