require 'threesmodel/game_board_folder'
require 'threesmodel/score_calculator'

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
  expect(@state).to eq(Matrix.rows(matrix))
end

Then(/^score is:"(.*?)"$/) do |score|
  actual_score = ScoreCalculator.score_for(@state)
  expect(actual_score).to eq(score.to_i)
end


Then(/^the gameboard can fold left$/) do
  expect(@game_board.can_fold_left?(@state)).to eq(true)
end

Then(/^the gameboard can fold down$/) do
  expect(@game_board.can_fold_down?(@state)).to eq(true)
end

Then(/^the gameboard can not fold up$/) do
  expect(@game_board.can_fold_up?(@state)).to eq(false)
end

Then(/^the gameboard can not fold right$/) do
  expect(@game_board.can_fold_right?(@state)).to eq(false)
end
