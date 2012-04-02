# card class
Card = (suit, number) ->
  _suit = suit
  _number = number

  @getNumber = -> _number
  @getSuit   = -> _suit

  @getValue = ->
    if _number is 1 then 11
    else if _number > 9 then 10
    else _number

  @getCardName = ->
    suits = ["clubs", "diamonds", "hearts", "spades"]
    ranks = ["A",2,3,4,5,6,7,8,9,10,"J","Q","K"]
    "#{ranks[_number - 1]} of #{suits[_suit - 1]}"

  return this

# deck class
Deck = ->
  cards = []
  for suit in [1..4]
    for rank in [1..13]
      cards.push new Card suit, rank

  @shuffle = ->
    cards.sort -> 0.5 - Math.random()

  @deal = -> cards.pop()

  return this

# new deck to play
deck = new Deck()
deck.shuffle()

# hand class
Hand = ->
  cards = [deck.deal(), deck.deal()]

  @getHand = -> cards
  @score = ->
    sum = aces = 0;
    for card in cards
      val = card.getValue()
      aces += 1 if val is 11
      sum += val
    while sum > 21 and aces > 0
      aces -= 1
      sum -= 10
    sum

  @printHand = ->
    output = []
    output.push card.getCardName() for card in cards
    output.join "\n"

  @hitMe = -> cards.push deck.deal()

  return this

# dealer
playAsDealer = ->
  hand = new Hand()
  hand.hitMe() while hand.score() < 17
  hand

# user
playAsUser = ->
  hand  = new Hand()
  hitMe = true
  while hitMe
    hitMe = confirm "#{_hand.printHand()}\n\nHit me?"
    hand.hitMe() if hitMe
  hand

# winner
declareWinner = (userHand, dealerHand) ->
  userScore   = userHand.score()
  dealerScore = dealerHand.score()

  if userScore > 21
    if dealerScore > 21 then "You tied!" else "You lose!"
  else if dealerScore > 21 then "You win!"
  else
    if userScore > dealerScore then "You win!"
    else if userScore is dealerScore then "You tied!"
    else "You lose!"

# play game
playGame = ->
  user = playAsUser()
  dealer = playAsDealer()

  console.log "User hand: #{user.printHand()} \n\n"
  console.log "Dealer hand: #{dealer.printHand()} \n\n"
  console.log declareWinner(user, dealer)

# play it!
playGame()
