# //create the following functions:
#
# // isFizzBuzzie
# // return true if the provided value is
# // a multiple of 3 or 5 but not both 3 and 5.
# // otherwise it returns false
# // arguments: number - integer
# // returns: true or false - boolean
#
# //getFizzBuzzSum
# //returns the sum of all the numbers below the maximum provided
# //which are multiples of 3 or 5 but not both
# //arguments: number - maximum value for search
# //returns: number - sum of the numbers below the maximum which are multiples of 3 or 5 but not both
#
# //getFizzBuzzCount
# //returns the count of all the numbers below the maximum provided
# //which are multiples of 3 or 5 but not both
# //arguments: number - maximum value for search
# //returns: number - count of the numbers below the maximum whihch are multiples of 3 or 5 but not both
#
# //getFizzBuzzAverage
# //returns the average(sum/count) of all the numbers below the maximum provided
# //which are multiples of 3 or 5 but not both
# //arguments: number - maximum value for search
# //returns: number - average(sum/count) of the numbers below the maximum whihch are multiples of 3 or 5 but not both
#
#
# // Write the isFizzBuzzie function by creating this new function inside your object and passing in a value. Test if that value is a multiple of 3 or 5 but not both 3 and 5. If it is a multiple of 3 or 5 and not a multiple of both 3 and 5 then return true otherwise return false.
# //
# // Write isFizzBuzzie as a function within FizzBuzzPlus. It will return true or false and take in a number which will be tested to determine if it is a multiple of 3 or 5 but not both 3 and 5.
# //

FizzBuzzPlus =
  isFizzBuzzie: (number) ->
    (number % 3 is 0 or number % 5 is 0) && number % 15 > 0

  getFizzBuzzSum: (number) ->
    sum = 0
    for num in [0...number]
      sum += num if @isFizzBuzzie(num)
    sum

  getFizzBuzzCount: (number) ->
    count = 0
    for num in [0...number]
      count += 1 if @isFizzBuzzie(num)
    count

  getFizzBuzzAverage: (number) ->
    @getFizzBuzzSum(number) / @getFizzBuzzCount(number)


console.log FizzBuzzPlus.getFizzBuzzAverage(100)

