=begin
Launch School: RB130 - Ruby Foundations: More Topics > Easy 2 > each_cons (Part 1)
ExerciseName: [each_cons (Part 1)](https://launchschool.com/exercises/7a2b407e)
FileName: easy2_x09_each_cons_part1.rb
Answered On: 12/28/2021
=end

def each_cons(arr)
  counter = 0
  
  while (counter + 1) < arr.size
    # p arr[counter..counter + 1]
    yield(arr[counter..counter + 1])
    counter += 1
  end
  
  nil
end

# added solution 03/18/2022
def each_cons(arr)
  arr.each.with_index do |num, idx|
    yield(num, arr[idx + 1]) if idx + 1 < arr.size
  end
  nil
end

# added solution 07/05/2022
# NOTE: Passing in only an array with 2 element as paramter
#       block paramters makes use of multiple assignment
def each_cons(arr)
  arr.each.with_index do |num, idx|
    yield(arr[idx..idx + 1]) unless idx + 1 == arr.size
  end

  nil
end


hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash  == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == {}


hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == {'a' => 'b'}