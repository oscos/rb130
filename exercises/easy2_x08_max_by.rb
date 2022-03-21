=begin
Launch School: RB130 - Ruby Foundations: More Topics > Easy 2 > max_by
ExerciseName: [max_by](https://launchschool.com/exercises/35a94033)
FileName: easy2_x08.rb
Answered On: 12/27/2021
=end

def max_by(arr)
  block_result = nil
  final_result = nil
  counter = 0
  
  while counter < arr.size
    current_element = arr[counter]
    
    if counter == 0 || yield(current_element) > block_result
      block_result = yield(current_element)
      final_result = current_element
    end
    counter += 1
  end
  
  final_result
end

# added solution 03/18/2022
def max_by(arr)
  result = nil

  arr.each.with_index do |num, idx| 
    if idx == 0
      result = num
    elsif yield(result) < yield(num)
      result = num
    end
  end

  result
end

# added solution 03/18/2022
def max_by(arr)
  return nil if arr.empty?

  result = arr[0]

  arr.each do |num|
    result = num if yield(result) < yield(num)
  end

  result
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil