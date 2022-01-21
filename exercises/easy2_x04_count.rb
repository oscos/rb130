=begin
Launch School: RB130 - Ruby Foundations: More Topics > Easy 2 > count
ExerciseName: [count](https://launchschool.com/exercises/c6c0d9a9)
FileName: easy2_x04_count.rb
Answered On: 12/27/2021
=end

def count(*arr)
  result = []
  counter = 0
  
  while counter < arr.size
    current_element = arr[counter]
    result << yield(current_element) if yield(current_element)
    counter += 1
  end
  
  result.size
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3