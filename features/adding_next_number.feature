Feature: One new number is added after every move.
Scenario: When only a single line has folded the probability of a number to be added at that line is 100%.

  Given a gameboard
  | 3|1|1|3|
  | 6|1|1|3|
  |12|1|1|3|
  | 6|1|1|3|
  When the game is folded downwards
  Then the probability for a new number in row "0" and column "3" is "100%"
