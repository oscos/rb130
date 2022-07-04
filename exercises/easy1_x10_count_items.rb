def count(arr)
  counter = 0

  arr.each do |n|
    counter += 1 if yield(n)
  end

  counter
end

# new solution added 07/03/2022
def count(arr)
  arr.select {|n| yield(n) }.size
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2