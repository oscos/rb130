begin
Launch School Course: RB130 - Ruby Foundations: More Topics
ExerciseLocation: Easy Testing
Exercises: 1 - 10
ExerciseURL: https://launchschool.com/exercise_sets/94a0efb0
FileName: easy_testing_1_to_10.rb
Answered On: 03/20/2022
=end

# Ex 1
assert_equal true, value.odd?

# Ex 2
assert_equal 'xyz', value.downcase

# Ex 3 - recommended
assert_nil value

# Ex 3 - also works
assert_equal nil, value

# Ex 4 - recommended
assert_empty list

# Ex 4 - also works
assert_equal true, list.empty?

# Ex 5 - recommended
assert_includes list, 'xyz'

# Ex 5 - also works
assert_equals true, list.include?('xyz')

# Ex 6
assert_raises NoExperienceError {
  employee.hire
}

# Ex 7
assert_instance_of Numeric, value

# Ex 8
assert_kind_of Numeric, value

# Ex 9
assert_same list list.process

# Ex 10
refute_includes list, 'xyz'