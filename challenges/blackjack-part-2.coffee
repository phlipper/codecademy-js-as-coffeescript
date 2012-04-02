# Make your card constructor again here, but make sure to use private
# variables!
Card = (suit, number) ->
  _suit = suit
  _number = number

  @getNumber = -> _number
  @getSuit   = -> _suit

  @getValue = ->
    switch _number
      when 11, 12, 13 then 10
      when 1 then 11
      else _number

  @getSuitName = ->
    { 1: "Clubs", 2: "Spades", 3: "Hearts", 4: "Diamonds" }[_suit]

  @getCardName = ->
    title = switch _number
      when 1  then "Ace"
      when 11 then "Jack"
      when 12 then "Queen"
      when 13 then "King"
      else number.toString()
    "#{title} of #{@getSuitName()}"

  return this


# // Make a deal function here.  It should return a new card with a suit
# // that is a random number from 1 to 4, and a number that is a random
# // number between 1 and 13
deal = ->
  suit   = Math.floor(Math.random() * 4 + 1)
  number = Math.floor(Math.random() * 13 + 1)
  new Card(suit, number)


# // examples of the deal function in action
card1 = deal()
card2 = deal()


Hand = ->
  cards = []

  @draw = ->
    cards.push deal()

  @score = ->
    sum = 0
    sum += card.getValue() for card in cards
    sum

  return this


myHand = new Hand()
yourHand = new Hand()

myHand.draw()
myHand.draw()
yourHand.draw()
yourHand.draw()

console.log "I scored a #{myHand.score()} and you scored a #{yourHand.score()}"

if yourHand.score() > myHand.score() then console.log "you win!"
else if yourHand.score() < myHand.score() then console.log "I win!"
else console.log "We tied!"
