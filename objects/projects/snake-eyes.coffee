rollSingleDice = ->
  Math.floor(Math.random() * 6 + 1)


rollDice = ->
  dice1 = rollSingleDice()
  dice2 = rollSingleDice()
  score = dice1 + dice2
  console.log "Dice 1: #{dice1} Dice 2: #{dice2} Score: #{score}"

  while dice1 is dice2
    console.log "Congratulations Double Thrown!"
    dice1 = rollSingleDice()
    dice2 = rollSingleDice()
    score += dice1 + dice2

  score

rollDice()


# // Now we have our rules engine almost finished we need to introduce some players.
# // To create these we can use objects then each player can hold their own score information and the name of that player (so we can tell who won at the end).
# // Let's start simple and create a constructor for a player object.
# // The object will have a name property, and a score value that needs to be hidden. It will also need methods to add to the score and to get the value of the score.
# // We can then use this object within our game to track how each player is doing.
# //
# // Don't delete the rest of your code!
# //
# // Create a constructor for an object called Player that takes a single argument of the player's name. Call the name property of the object name.
# // Your object should also store a score for the player - keep this hidden but initialise it to 0.
# // Your object should have a function that allows you to add to the players score (also called a setter method). Call this addToScore. It should have one parameter for the amount you want to add to the score.
# // Your object also needs a function to retrieve the players score (also called a accessor or getter method). Call this getScore.
# // Create a player called player1 based on your new object.
# // Call player1.addToScore(5) to add 5 to your player's score.
#
Player = (@name) ->
  score = 0;
  @addToScore = (amount) -> score += amount
  @getScore = -> score
  return this

player1 = new Player "Phil"
player1.addToScore 5

#
# // Now we have a player for our game we'd best make our rollDice function interact with the players to update their score as the dice have been rolled.
# // To do this we will pass the player object to the rollDice function and make it update the player's score.
# // Now the rollDice function doesn't need to return the score from that round of dice rolling - we're going to change what it returns a little bit later...
# //
# // You should keep most of your code from last time.
# //
# // Change your rollDice function so that it accepts a single parameter of a player object
# // Inside your rollDice function you should call player.addToScore to add the current dice rolls to the player's score.
# // You still need to create a Player object called player1 then call rollDice passing it your player1 object.
# // Get rid of the code that added 5 to the player's score.
# // Change the console.log commands in your rollDice function so they print out the player's current total score rather than the score from just that round of rolls.
# // Remove the variable from the rollDice function that is tracking the total score for that round of dice rolls and make the rollDice function return false.
#
#
#
#
# // Make your rollDice function test for when Snake Eyes (double 1) has been rolled (after adding the value to the score)
# // Print out to the console Snake Eyes! rather than congratulating the player for rolling a double.
# // Return true after printing out Snake Eyes!
# // Create a variable called snakeEyes and initialise it to false.
# // Rather than calling rollDice once put it inside a while loop which runs until snakeEyes becomes true (which rollDice should update).
#
#
#
# // Modify your turns loop to print out each turn as they occur - a turn is a single throw of the dice. Each turn should start with Turn N printed to the console where N is the number of the turn (starting at 1).
# // Turns should continue until Snake Eyes has been thrown and then print out the final score for the player. This should include the player's name. For example "player1 scored 32".
#
#
# // Playing with just one player isn't fun!.
# // Create an array of Player objects and loop through them during each turn. You will have to check for when snake eyes has been thrown and then print out the score each player has gained. We will work out which player has won in the next exercise.
# //
# // Create an array called players
# // Add 4 players to the array you should prompt the user for the names of each of these players.
# // Change your loop so that while it is checking for Snake Eyes it also loops through the array so each player gets a turn - probably using a for loop.
# // You will need to double check that Snake Eyes! hasn't been thrown before each player has a throw.
# // Print out the players name before they have a throw.
# // After Snake Eyes has been thrown loop through all of the players and print out their score.
#
#
# // Wow, we've finished the simple game and can tell everyone their scores. Now we have to work out which player has won and give congratulations to the winner.
# // We also have to check to see if there was a draw and if there was congratulate all the players with the same score.
# // We can do this by looping through our array of players and finding the highest score. We can then build an array of winners who share the highest score.
# // This will then allow us to congratulate all of the winners.
# //
# // After the Snake Eyes has been rolled loop through all of the players and find the highest score. Store this in a variable called highScore.
# // Find all of the players who scored the highScore and add them to an array called winners.
# // Loop through the winners building up a single line that congratulates all winners. For two winners (called player2 and player3) it should look like:
# // "Congatulations player2 and player3 you have won!"
#
players = []
for i in [0..3]
  name = prompt "What is your name?"
  players.push new Player(name)


snakeEyes = false
numRolls = 0
rollDice = (player) ->
  dice1 = rollSingleDice()
  dice2 = rollSingleDice()
  player.addToScore(dice1 + dice2)

  # console.log("Dice 1: " + dice1 + " Dice 2: " + dice2 + " Score: " + score);
  console.log(player.getScore());

  while dice1 is dice2
    if dice1 is 1 and dice2 is 1
      console.log "Snake Eyes!"
      snakeEyes = true
      return snakeEyes
    else
      console.log "Congratulations Double Thrown!"

    dice1 = rollSingleDice()
    dice2 = rollSingleDice()
    player.addToScore(dice1 + dice2)

  return false


while snakeEyes isnt true
  numRolls++
  console.log "Turn #{numRolls}"
  for player in players
    if snakeEyes isnt true
      console.log player.name
      rollDice player

for player in players
  console.log "#{player.name} scored #{player.getScore()}"


highScore = 0
winners   = []
congrats  = ""

for player in players
  score = player.getScore()
  highScore = score if score > highScore

for player in players
  winners.push player if player.getScore() is highScore

str = "Congratulations "
for winner in winners
  str += winner.name
  if (winner + 1 < winners.length) then str += " and "
str += " you have won!"

console.log str
