=begin
Launch School Course: RB130 - Ruby Foundations: More Topics
ExerciseLocation: Easy 1
ExerciseName: Optional Blocks
ExerciseURL: https://launchschool.com/exercises/583a1348
FileName: easy1_x01_enumerable_class_creation.rb
Answered On: 12/27/2021
=end

def compute
  if block_given?
    yield
  else
    'Does not compute.'
  end
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# additional explorationi
def compute2(param)
  return 'Does not compute.' unless block_given?

  yield(param)
end

p compute2(15) { |num| num**3 } == 3375
p compute2('a') { |num| num + num } == 'aa'
p compute2(5) == 'Does not compute.'
