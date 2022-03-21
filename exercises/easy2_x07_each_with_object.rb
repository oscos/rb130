=begin
Launch School: RB130 - Ruby Foundations: More Topics > Easy 2 > each_with_object
ExerciseName: [each_with_object](https://launchschool.com/exercises/a890a029)
FileName: easy2_x07.rb
Answered On: 12/27/2021
=end

def each_with_object(arr, obj_type)
  result = obj_type
  counter = 0
  
  while counter < arr.size
    current_element = arr[counter]
    yield(current_element, result)
    counter += 1
  end
  
  result
end

# added solution 03/18/2022
def each_with_object(arr, obj)
  counter = 0
  
  while counter < arr.size
    current_element = arr[counter]
    yield(current_element, obj)
    counter += 1
  end

  obj
end

# added solution 03/18/2022
def each_with_object(arr, obj)
  arr.each do |el|
    yield(el, obj)
  end
  obj
end


result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}