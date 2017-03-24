require 'threesmodel'
require 'threesmodel/game_board_folder'
Before do
end

Given(/^a new game is started$/) do
   @game_controller = Threesmodel::GameController.new
   @game_state = @game_controller.start_new_game
   @gameboard_folder = GameBoardFolder.new
end

Then(/^an id is attached to the game$/) do
  expect(@game_state[:id]).to_not eq(nil)
end

Then(/^the game is not over$/) do
  expect(@game_state[:game_over]).to eq(false)
end


Then(/^the game board has (\d+) cells filled$/) do |filled_cells|
  c = []
  values = @game_state[:game].row_vectors.each{|row|
    c << row.to_a
  }
  c.flatten!
  d = c.find_all{|item| item > 0}
  expect(d.size).to eq(9)
end

Then(/^the board contains no other but the following numbers:$/) do |table|
  data = table.raw[0]
  data = data.map{|x| x.to_i}
  c = []
  @game_state[:game].row_vectors.each{|row|
    c << row.to_a
  }
  c.flatten!.uniq!
  c.each{|value|
    expect(data.include?(value.to_i)).to eq(true)
  }
end
