newArray = []

# // Here I filled the spots in the newArray with 0s so we can
# // count their occurances in the loops below
newArray[i] = 0 for i in [2..12]

# // Now increment the array to have the proper probabilities again
for i in [1..6]
  for j in [1..6]
    newArray[i + j] += 1

# // Here I initialize the set of variables we will need for our game
# // they are score, totalScore, answer, and the two die's die1 and die2
score = 0
totalScore = 0
answer = ""

loop
  die1 = Math.floor(Math.random() * 6 + 1)
  die2 = Math.floor(Math.random() * 6 + 1)

  if die1 is die2
    totalScore = 0
    break
  else if (die1 + die2) is 4
    totalScore = -50
  else if (die1 + die2) is 10
    totalScore = -100
  else
    score = (10 - newArray[(die1 + die2)]) * 10

  totalScore += score

  console.log "You rolled a: #{die1} and a: #{die2} for a roll of: #{die1 + die2}"
  console.log "You got a score of: #{score}. Your total score is: #{totalScore}"

  break unless prompt "Do you want to keep playing (y/n)" is "y"


