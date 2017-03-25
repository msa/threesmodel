Feature: For every game state there is a score.
Scenario: Ones and twos give zero points.
  Given a game board
  |0|0|0|1|
  |0|1|2|0|
  |2|1|0|2|
  |1|2|1|0|
  Then score is:"0"

Scenario: A three gives 3 points
  Given a game board
  |0|0|0|1|
  |0|1|2|0|
  |2|1|0|2|
  |1|2|1|3|
  Then score is:"3"

Scenario: A six gives 9 points
  Given a game board
  |0|0|0|1|
  |0|1|2|0|
  |2|1|0|2|
  |1|2|1|6|
  Then score is:"9"

Scenario: A 12 gives 27 points
  Given a game board
  |0|0|0| 1|
  |0|1|2| 0|
  |2|1|0| 2|
  |1|2|1|12|
  Then score is:"27"

Scenario: A 24 gives 81 points
  Given a game board
  |0|0|0| 1|
  |0|1|2| 0|
  |2|1|0| 2|
  |1|2|1|24|
  Then score is:"81"

Scenario: A 48 gives 243 points
  Given a game board
  |0|0|0| 1|
  |0|1|2| 0|
  |2|1|0| 2|
  |1|2|1|48|
  Then score is:"243"

Scenario: A 96 gives 729 points
  Given a game board
  |0|0|0| 1|
  |0|1|2| 0|
  |2|1|0| 2|
  |1|2|1|96|
  Then score is:"729"

Scenario: A 192 gives 2187 points
  Given a game board
  |0|0|0|  1|
  |0|1|2|  0|
  |2|1|0|  2|
  |1|2|1|192|
  Then score is:"2187"

Scenario: A 384 gives 6561 points
  Given a game board
  |0|0|0|  1|
  |0|1|2|  0|
  |2|1|0|  2|
  |1|2|1|384|
  Then score is:"6561"

Scenario: A 768 gives 19683 points
  Given a game board
  |0|0|0|  1|
  |0|1|2|  0|
  |2|1|0|  2|
  |1|2|1|768|
  Then score is:"19683"

Scenario: A 1536 gives 59049 points
  Given a game board
  |0|0|0|   1|
  |0|1|2|   0|
  |2|1|0|   2|
  |1|2|1|1536|
  Then score is:"59049"

Scenario: A 3072 gives 177147 points
  Given a game board
  |0|0|0|   1|
  |0|1|2|   0|
  |2|1|0|   2|
  |1|2|1|3072|
  Then score is:"177147"

Scenario: A 6144 gives 531441 points
  Given a game board
  |0|0|0|   1|
  |0|1|2|   0|
  |2|1|0|   2|
  |1|2|1|6144|
  Then score is:"531441"

Scenario: All points are summed up
  Given a game board
  |   1|   2|  3|   6|
  |  12|  24| 48|  96|
  | 192| 384|768|1536|
  |3072|6144|  0|   0|
  Then score is:"797160"
