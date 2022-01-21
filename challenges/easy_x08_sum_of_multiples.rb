=begin
Launch School: RB130 - Ruby/JavaScript Challenges > Easy Challenges
ExerciseName: []()
FileName: easy_challenges_x08.rb
Answered On: 01/12/2022
=end

class SumOfMultiples
  
  def initialize(*digits)
    @digits = *digits
  end
  
  def to(num)
    find_sum(num, @digits)
  end
  
  def self.to(num)
    SumOfMultiples.new.find_sum(num, [3,5])
  end
  
  def find_sum(num, arr)
    result = []
    
    (num - 1).downto(0) do |n|
      arr.each do |i|
        result << n if n % i == 0
      end 
    end
    
    result.uniq.sum
  end

end