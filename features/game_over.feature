Feature: A game ends when there is no foldable line.
Scenario: An unfoldable game board means that the game is over.
  Given an unfoldable game board
  Then the game is over

Scenario: A foldable game board means that the game continues.
  Given a foldable game board
  Then the game continues
