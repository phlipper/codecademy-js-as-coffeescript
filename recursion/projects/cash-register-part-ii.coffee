cashRegisterWithChange =
  total: 0
  change: 0
  coinNames: ["five dollar bills", "one dollar bills", "quarters", "dimes", "pennies"]
  currency: [5.00, 1.00, 0.25, 0.10, 0.01]

  setTotal: (amount) ->
    @total = amount

  getPaid: (amountPaid) ->
    if @total > amountPaid
      console.log "Not enough!"
    else
      @change = amountPaid - @total
      console.log "Give them:"
      @makeChange @coinNames, @currency, 0

  howManyCoins: (coinName, coinAmount, coinsSoFar) ->
    if @change < coinAmount
      console.log "#{coinsSoFar} #{coinName}"
    else
      @change -= coinAmount;
      @change = @change.toFixed(2);
      @howManyCoins coinName, coinAmount, coinsSoFar + 1

  makeChange: (coinNames, currency, index) ->
    if index >= currency.length
      return
    else
      @howManyCoins coinNames[index], currency[index], 0
      @makeChange coinNames, currency, index + 1


# and leave these calls to check if you get the correct output
cashRegisterWithChange.setTotal 100
cashRegisterWithChange.getPaid 50
cashRegisterWithChange.getPaid 109.94
