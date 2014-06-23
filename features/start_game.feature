Feature: Start a new game.
Scenario: A newly created game is not over before first fold.
  Given a new game is started
  Then the game is not over

Scenario: A newly created game is identified by an id.
  Given a new game is started
  Then an id is attached to the game

Scenario: A newly created game returns a game board with nine cells filled.
  Given a new game is started
  Then the game board has 9 cells filled
  And the board contains no other but the following numbers:
  |0|1|2|3|
