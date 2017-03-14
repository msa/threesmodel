Feature: The start situation is playable and equal numbers fold to create new, double numbers.
Scenario: Threes will fold into sixes.
  Given a gameboard
  |0| 0|0|0|
  |0| 0|0|0|
  |3| 6|0|0|
  |3|12|2|0|
  When the game is folded downwards
  Then the gameboard looks like
  |0| 0|0|0|
  |0| 0|0|0|
  |0| 6|0|0|
  |6|12|2|0|

Scenario: Equal numbers in several lines
  Given a gameboard
  |1|2| 0| 0|
  |1|2| 0| 0|
  |3|6|12|24|
  |3|6|12|24|
  When the game is folded downwards
  Then the gameboard looks like
  |0| 0| 0| 0|
  |1| 2| 0| 0|
  |1| 2| 0| 0|
  |6|12|24|48|

Scenario: Equal numbers in the middle of the line
  Given a gameboard
  |6|2| 3| 0|
  |6|3|12|24|
  |6|3|12|24|
  |3|6| 3| 3|
  When the game is folded downwards
  Then the gameboard looks like
  | 0|0| 0| 0|
  | 6|2| 3| 0|
  |12|6|24|48|
  | 3|6| 3| 3|

Scenario: Fold an unanimous matrix completely
  Given a gameboard
  |12|12|12|12|
  |12|12|12|12|
  |12|12|12|12|
  |12|12|12|12|
  When the game is folded downwards
  Then the gameboard looks like
  | 0| 0| 0| 0|
  |12|12|12|12|
  |12|12|12|12|
  |24|24|24|24|
  When the game is folded downwards
  Then the gameboard looks like
  | 0| 0| 0| 0|
  | 0| 0| 0| 0|
  |24|24|24|24|
  |24|24|24|24|
  When the game is folded downwards
  Then the gameboard looks like
  | 0| 0| 0| 0|
  | 0| 0| 0| 0|
  | 0| 0| 0| 0|
  |48|48|48|48|
  When the game is folded right
  Then the gameboard looks like
  |0| 0| 0| 0|
  |0| 0| 0| 0|
  |0| 0| 0| 0|
  |0|48|48|96|
  When the game is folded right
  Then the gameboard looks like
  |0|0| 0| 0|
  |0|0| 0| 0|
  |0|0| 0| 0|
  |0|0|96|96|
  When the game is folded right
  Then the gameboard looks like
  |0|0|0|  0|
  |0|0|0|  0|
  |0|0|0|  0|
  |0|0|0|192|
