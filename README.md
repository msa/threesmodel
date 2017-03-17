# Threesmodel

This is an attempt at emulating the game model of the excellent game "Threes".
It is implemented in Ruby and specified with Gehrkin and rspec examples.
The gem is not indended to be a game in it self, but with relative ease one
could use it as the game engine for a command line or a web version of the game.
It supports playing multiple games simultaneously.

## Installation

Add this line to your application's Gemfile:

    gem 'threesmodel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install threesmodel

## Usage

Creating and playing a basic game works like this:

```ruby
    require 'threesmodel'
    game_controller = Threesmodel::GameController.new
    game_state = game_controller.start_new_game
```

The game state object is a hash with the keys :id (the identifier of the game),
:game the layout of the current game board (as an instance of a Matrix class),
:game_over (boolean that denotes whether the game is over or not),
:next_number states the number to be added after the next fold and
:score that states the current score.

Play by issuing fold calls to the game controller identifying the game with the id like this:

```ruby
    game_state = game_controller.fold_left(game_state[:id])
    game_state = game_controller.fold_right(game_state[:id])
    game_state = game_controller.fold_up(game_state[:id])
    game_state = game_controller.fold_down(game_state[:id])
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
