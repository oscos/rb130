# Write a method that returns a list of all of the divisors of the
# positive integer passed in as an argument. The return value can
# be in any sequence you wish.

def divisors(num)
  result = []

  1.upto(num) do |n|
    result << n if num % n == 0
  end

  result
end

# method 2
# def divisors2(num)
#   1.upto(num).select do |n|
#     n if num % n == 0
#   end
# end

# solution added 07/03/2022
(1..num).select do |n|
  num % n == 0
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
