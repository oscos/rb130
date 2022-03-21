=begin
Launch School: RB130 - Ruby Foundations: More Topics > Easy 2 > From-To-Step Sequence Generator
ExerciseName: [Zipper](https://launchschool.com/exercises/ec8dd514)
FileName: easy2_x01_from_to_step_sequence_generator.rb
Answered On: 12/27/2021
=end

def step(num_start, num_end, num_step) 
  arr = (num_start..num_end).to_a
  counter = 0
  
  while counter < arr.size
    current_element = arr[counter]
    yield(current_element)
    counter += num_step
  end

  arr
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10


# additional solution added 03/18/2022
def step2(txt_start, txt_end, txt_step)
  while txt_start <= txt_end
    yield(txt_start)
    txt_start += txt_step
  end
end

step2(1, 10, 3) { |value| puts "value = #{value}" }