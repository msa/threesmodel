Feature: A game ends when there is no foldable line.
Scenario: An unfoldable game board means that the game is over.
  Given an unfoldable game board
  Then the game is over

Scenario: A foldable game board means that the game continues.
  Given a foldable game board
  Then the game continues

Scenario: A game board that folds in only one direction means that the game continues.
  Given a game board that only folds left and up
  Then the game continues
  Given a game board that only folds left and down
  Then the game continues
  Given a game board that only folds right and up
  Then the game continues
  Given a game board that only folds right and down
  Then the game continues
