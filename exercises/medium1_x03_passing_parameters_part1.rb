=begin
Launch School: RB130 - Ruby Foundations: More Topics > Medium 1 > Passing Parameters Part 1
ExerciseName: [Passing Parameters Part 1](https://launchschool.com/exercises/c7f39d55)
FileName: medium1_x03_passing_parameters_part1.rb
Answered On: 12/29/2021
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items){ puts "#{items.join(', ')}"}