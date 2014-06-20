require 'rspec'
require_relative '../lib/game_creator'
require 'custom_matchers'

describe 'Create new Game' do

  include CustomMatchers

  it 'should should randomly position nine cells' do
    game_state = GameCreator.create_new_game()
    cells_in_game(game_state).should eq(9)
  end

  it 'should determine nine coordinates' do
    GameCreator.random_positions(9).size.should eq(9)
  end

  it 'should only use 1s 2s and 3s when initiating game board' do
    game_state = GameCreator.create_new_game()
    game_state.row_vectors.each{|row|
      row.to_a.each{|value|
        value.should be_one_of([0,1,2,3])
      }
    }
  end
end

def cells_in_game(game_state)
  cells = 0
  game_state.row_vectors.each{|row|
    row.to_a.each{|val|
      if val > 0 then cells = cells + 1 end
    }
  }
  cells
end
