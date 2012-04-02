# DEALING CARDS
miniDeck = ["ace","king","queen","jack",10,9,8,7,6,5,4,3,2]

deal = (numberOfCards) ->
  if numberOfCards > 0
    # store random number between 0
    # and the total number of cards in the miniDeck
    rand = Math.floor(Math.random() * miniDeck.length)
    card = miniDeck[rand]
    # output card selected
    console.log "Your card is #{card}"
    # remove selected card from deck
    miniDeck.splice rand, 1

    # remove from numberOfCards
    numberOfCards--

    # recursively call the function
    deal numberOfCards

# Call the function and pass the number of cards you want to deal
deal 5
