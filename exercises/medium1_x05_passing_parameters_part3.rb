=begin
Launch School: RB130 - Ruby Foundations: More Topics > Medium 1 > Passing Parameters Part 3
ExerciseName: [Passing Parameters Part 3](https://launchschool.com/exercise_sets/f3f8b728)
FileName: medium1_x05_passing_parameters_part3.rb
Answered On: 12/29/2021
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1)
gather(items) do | *first_second_third , fourth |
  puts "#{first_second_third.join(', ')}"
  puts "#{fourth_item}"
end

# 2)
gather(items) do | first, *second_third, fourth |
  puts "#{first}"
  puts "#{second_third.join(', ')}"
  puts "#{fourth}"
end


# 3)
gather(items) do | first, *second_third_fourth |
  puts "#{first}"
  puts "#{second_third_fourth.join(', ')}"
end

# 4)
gather(items) do | first, second, third, fourth |
  puts "#{first}, #{second}, #{third}, and #{fourth}"
end