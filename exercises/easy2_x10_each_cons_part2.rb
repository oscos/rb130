=begin
Launch School: RB130 - Ruby Foundations: More Topics > Easy 2 > each_cons (Part 2)
ExerciseName: [each_cons (Part 2)](https://launchschool.com/exercises/711c6a89)
FileName: easy2_x10_each_cons_part2.rb
Answered On: 12/28/2021
=end

def each_cons(arr, num)
  counter = 0

  # original answer 12/28/2021
  while (counter + num - 1) < arr.size
    yield(*arr[counter..(counter + num - 1)])
    counter += 1
  end

  # original answer 12/28/2021  
  while num == arr[counter..(counter + num - 1)].size
    yield(*arr[counter..(counter + num - 1)])
    counter += 1
  end
  
  # refactored anser 01/10/2022
  while num == arr[counter, num].size
    yield(*arr[counter, num])
    counter += 1
  end
  
  nil
end

# answer added 03/18/2022
def each_cons(arr, n)
  counter = 0
  counter2 = n - 1

  while counter2 < arr.size
    yield(*arr[counter..counter2])
    counter += 1
    counter2 += 1
  end

  nil
end

# answer added 07/05/2022
def each_cons(arr, n)
  arr.each.with_index do |_, idx|
    yield(*arr[idx..idx + (n - 1)]) if idx + (n - 1) < arr.size
  end

  nil
end


hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}