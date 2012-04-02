result = ""
player = prompt "Pick rock, paper, or scissors."

# // // If the player types "ROCK," the script needs to read that the same
# // // as "rock", but only if player !== null!
player = player.toLowerCase() if player?

choices = ["rock","paper","scissors"]
computer = choices[Math.floor(Math.random()*3)]

win  = "Your #{player} beats #{computer}. You win."
lose = "Your #{player} loses to #{computer}. You lose."
draw = "A draw: #{player} on #{computer}."

if player is "rock"
  if computer is "scissors"
    result = win
  else if computer is "paper"
    result = lose
  else if computer is "rock"
    result = draw
else if player is "paper"
  if computer is "rock"
    result = win
  else if computer is "scissors"
    result = lose
  else if computer is "paper"
    result = draw
else if player is "scissors"
  if computer is "paper"
    result = win
  else if computer is "rock"
    result = lose
  else if computer is "scissors"
    result = draw
else if player is null
  result = "Bye!"
else
  result = "I said rock, paper, or scissors!"


# // // If the player clicks cancel, the 'result' should equal "Bye!"
# //
# //
# // // If the player enters any other string, 'result' should equal
# // // "I said rock, paper, or scissors!"
# //
# //
# //
console.log result
