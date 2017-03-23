Feature: The start situation is playable and 1's fold into 2's to create 3's.
Scenario: I have just started a game. The board is full of small numbers and empty cells.

  Given a gameboard
  |0|1|2|0|
  |0|1|2|0|
  |0|1|2|0|
  |0|1|2|0|
  When the game is folded right to left
  Then the gameboard looks like
  |1|2|0|0|
  |1|2|0|0|
  |1|2|0|0|
  |1|2|0|0|

Scenario: I am folding ones and twos in a fairly empty board
  Given a gameboard
  |1|2|0|0|
  |1|2|0|0|
  |1|2|0|0|
  |1|2|0|0|
  When the game is folded right to left
  Then the gameboard looks like
  |3|0|0|0|
  |3|0|0|0|
  |3|0|0|0|
  |3|0|0|0|

Scenario: I am folding right over zeros
  Given a gameboard
  |1|2|0|0|
  |1|2|0|0|
  |1|2|0|0|
  |1|2|0|0|
  When the game is folded left to right
  Then the gameboard looks like
  |0|1|2|0|
  |0|1|2|0|
  |0|1|2|0|
  |0|1|2|0|

Scenario: I am folding up over zeros
  Given a gameboard
  |0|0|0|0|
  |2|2|2|2|
  |1|1|1|1|
  |0|0|0|0|
  When the game is folded upwards
  Then the gameboard looks like
  |2|2|2|2|
  |1|1|1|1|
  |0|0|0|0|
  |0|0|0|0|

Scenario: I am folding down over zeros
  Given a gameboard
  |0|0|0|0|
  |2|2|2|2|
  |1|1|1|1|
  |0|0|0|0|
  When the game is folded downwards
  Then the gameboard looks like
  |0|0|0|0|
  |0|0|0|0|
  |2|2|2|2|
  |1|1|1|1|

  Scenario: Folding a specific gameboard
    Given a gameboard
    |2|24| 1|24|
    |0| 3| 6|12|
    |0| 6| 2| 2|
    |0| 0| 0| 3|
    Then the gameboard can fold left
    And the gameboard can fold down
    And the gameboard can not fold up
    And the gameboard can not fold right

  Scenario: Folding a specific gameboard
    Given a gameboard
      |6|12| 1| 6|
      |2| 6| 1| 1|
      |0| 0| 3|12|
      |0| 0| 0| 2|
    Then the gameboard can fold left
    And the gameboard can fold down
    And the gameboard can not fold up
    And the gameboard can not fold right
