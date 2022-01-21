=begin
Launch School: RB130 - Ruby/JavaScript Challenges > Easy Challenges
ExerciseName: []()
FileName: easy_challenges_x09.rb
Answered On: 01/13/2022
=end

class Series
  attr_accessor :str
  
  def initialize(str)
    @str = str
  end

  def slices(num)
    raise ArgumentError.new if num > str.size

    result = []
    
    str.chars.each_cons(num) do |subarr|
      # p result << subarr
      result << subarr.map(&:to_i)
    end

    result 
  end
  
end