require 'Matrix'
require_relative '../../lib/game_board_folder'
Given(/^a gameboard$/) do |table|
  @game_board = GameBoardFolder.new
  matrix = table.raw
  matrix = matrix.map{|l| l.map{|cell| cell.strip.to_i}}
  @state = Matrix.rows(matrix)
end

When(/^the game is folded right to left$/) do
  @state = @game_board.fold_left @state
end

When(/^the game is folded left to right$/) do
  @state = @game_board.fold_right @state
end

When(/^the game is folded upwards$/) do
  @state = @game_board.fold_up @state
end

When(/^the game is folded downwards$/) do
  @state = @game_board.fold_down @state
end

When(/^the game is folded right$/) do
  @state = @game_board.fold_right @state
end

Then(/^the gameboard looks like$/) do |table|
  matrix = table.raw
  matrix = matrix.map{|l| l.map{|cell| cell.strip.to_i}}
  @state.should == Matrix.rows(matrix)
end
