def one?(arr)
  counter = 0
  
  arr.each do |n|
    return false if counter > 1
    counter += 1 if yield(n)
  end

  counter == 1
end

# new solution added 07/03/2022
def one?(arr)
  result = []
  
  arr.each do |n|
    return false if result.size > 1
    result << yield(n) if yield(n)
  end

  result.size == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false