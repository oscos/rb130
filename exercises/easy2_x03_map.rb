=begin
Launch School: RB130 - Ruby Foundations: More Topics > Easy 2 > map
ExerciseName: [map](https://launchschool.com/exercises/8341f1f1)
FileName: easy2_x03_map.rb
Answered On: 12/27/2021
=end

def map(arr)
  result = []
  counter = 0
  
  while counter < arr.size
    current_element = arr[counter]
    result << yield(current_element)
    counter += 1
  end
  
  result
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# additional solution added 03/18/2022
def map2(arr)
  result = []
  arr.each do |el|
    result << yield(el)
  end
  result
end

p map2([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map2([]) { |value| true } == []
p map2(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map2(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map2([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]