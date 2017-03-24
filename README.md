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

## Creating an automated solver

If you want to try to make an automated puzzel solver. You can do the following.

```ruby
  require 'threesmodel'
  class MySmartPlayer < Threesmodel::BaseGameAutomation


    def play()
      # for your convenience you will have a few API classes set up for you.
      # these two gives you the opportunity to try things out, before you decide
      # which move you want to make
      @game_board_folder
      @score_calculator

      # The game controller allows you to execute a move (or fold as I like to call it)
      @game = @game_controller.fold_down(@game[:id])
    end
```
Note that you should keep the state returned after the fold in order to be able
to progress with the game.

Then you should call the automated solver in this manner (I usually use a rspec test cases as a runner).

```ruby
  player = MySmartPlayer.new
  player.play_many(number_of_games_to_play)
```
Where the "number_of_games_to_play" parameter is an integer stating the numnber of games the algorithm shall play.
The end result is a few stats about the runs. High score, a histogram of the value of the highest cell in the game board.
And a file (called by the solver class name dot txt) containing all the scores if you want to make your own statistical analysis.

Happy hacking!

Future ideas is to create some basic suppurt for setting up a solver algorithm competition.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
