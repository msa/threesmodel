require 'rspec'
require_relative '../lib/game_creator'
require 'custom_matchers'

describe 'Create new Game' do

  include CustomMatchers

  it 'should randomly position nine cells' do
    game_state = GameCreator.create_new_game()
    expect(cells_in_game(game_state)).to eq(9)
  end

  it 'should determine nine coordinates' do
    expect(GameCreator.random_positions(9).size).to eq(9)
  end

  it 'should only use 1s 2s and 3s when initiating game board' do
    game_state = GameCreator.create_new_game()
    game_state.row_vectors.each{|row|
      row.to_a.each{|value|
        expect(value).to be_one_of([0,1,2,3])
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
