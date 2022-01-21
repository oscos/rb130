=begin
Launch School: RB130 - Ruby Foundations: More Topics > Easy 2 > each_with_index
ExerciseName: [each_with_index](https://launchschool.com/exercises/12e1e19c)
FileName: easy2_x06_each_with_index.rb
Answered On: 12/27/2021
=end

def each_with_index(arr)
  counter = 0
  
  while counter < arr.size
    current_element = arr[counter]
    yield(current_element, counter)
    counter += 1
  end
  
  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true