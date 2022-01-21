=begin
Launch School: RB130 - Ruby Foundations: More Topics > Easy 2 > Zipper
ExerciseName: [Zipper](https://launchschool.com/exercises/7c6be14d)
FileName: easy2_x02_zipper.rb
Answered On: 12/27/2021
=end

def zip(arr1, arr2) 
  result = []
  counter = 0
  
  while counter < arr1.size
    current_element = [arr1[counter], arr2[counter]]
    result << current_element
    counter += 1
  end

  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]