=begin
Launch School: RB130 - Ruby Foundations: More Topics > Easy 2 > drop_while
ExerciseName: [drop_while](https://launchschool.com/exercise_sets/3ea9ead7)
FileName: easy2_x05_drop_while.rb
Answered On: 12/27/2021
=end

def drop_while(arr)
  result = []
  counter = 0
  
  while counter < arr.size
    current_element = arr[counter]
    return arr[counter..-1] unless yield(current_element)
    counter += 1
  end
  
  result
end

# solution added 03/18/2022
def drop_while(arr)
  counter = 0
  flag = false
  arr.each.with_index do |el, idx|
    unless yield(el)
      flag = true
      counter = idx
      break
    end
  end
  flag ? arr[counter..-1] : []
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []