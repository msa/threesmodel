require 'Matrix'
require_relative '../../lib/game_board'
Given(/^a gameboard$/) do |table|
  @game_board = GameBoard.new
  matrix = table.raw
  matrix = matrix.map{|l| l.map{|cell| cell.strip.to_i}}
  @game_board.state = Matrix.rows(matrix)
end

When(/^the game is folded right to left$/) do
  @game_board.fold_left
end

When(/^the game is folded left to right$/) do
  @game_board.fold_right
end

When(/^the game is folded upwards$/) do
  @game_board.fold_up
end

When(/^the game is folded downwards$/) do
  @game_board.fold_down
end

When(/^the game is folded right$/) do
  @game_board.fold_right
end

Then(/^the gameboard looks like$/) do |table|
  matrix = table.raw
  matrix = matrix.map{|l| l.map{|cell| cell.strip.to_i}}
  @game_board.state.should == Matrix.rows(matrix)
end

Then(/^the probability for a new number in row "(.*?)" and column "(.*?)" is "(.*?)%"$/) do |row, column, probability|
  @game_board.probability_for(row, column).should == probability
end
