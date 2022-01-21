=begin
Launch School: RB130 - Ruby Foundations: More Topics > Medium 1 > Passing Parameters Part 2
ExerciseName: [Passing Parameters Part 2](https://launchschool.com/exercises/8621919c)
FileName: medium1_x04_passing_parameters_part2.rb
Answered On: 12/29/2021
=end

def assignment(arr)
  yield(arr)
end

birds = %w(raven finch hawk eagle)

# assignment(birds){ |item| puts "Raptors: #{item[2..-1].join(', ')}." }
assignment(birds){ |_, _, *items| puts "Raptors: #{items.join(', ')}." }