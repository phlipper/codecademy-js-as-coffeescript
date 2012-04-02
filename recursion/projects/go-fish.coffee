cards = ["ace","king","queen","jack",10,9,8,7,6,5,4,3,2]
hand = []

dealHand = (numberOfCards) ->
  if numberOfCards > 0
    # Store a random number
    rand = Math.floor(Math.random() * cards.length)
    card = cards[rand]

    # Add card to the hand array
    hand.push card

    # Output the card
    console.log "Your card is #{card}"
    # remove card selected from cards array
    cards.splice rand, 1

    # remove from numberOfCards
    numberOfCards--

    # recursive function call
    dealHand numberOfCards

goFish = (num, guess) ->
  if num >= 0
    if hand[num] is guess
      console.log "A Match for", hand[num]
      return
    else if num is 0
      console.log "Go Fish: No matches for #{guess}"

    # remove from num
    num--

    # recursive function call... remember to use both arguments
    goFish num, guess

# Call dealHand and goFish
dealHand 5
goFish hand.length, 3
