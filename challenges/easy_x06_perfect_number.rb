=begin
Launch School: RB130 - Ruby/JavaScript Challenges > Easy Challenges
ExerciseName: []()
FileName: easy_challenges_x06.rb
Answered On: 01/12/2022
=end

=begin
def classify(num)
  sum = 0
  
  (num - 1).downto(1) do |n|
    sum += n if num % n == 0
  end
  
  result =
    case 
      when sum == num then "perfect"
      when sum  > num then "abundant"
      else
        "deficient"
    end
  
  result
end
p classify(24)
=end

class PerfectNumber
  
  def self.classify(num)
    raise StandardError.new if num < 1
    sum = PerfectNumber.new.calculate(num)
    
    case
      when sum == num then "perfect"
      when sum > num  then "abundant"
      when sum < num  then "deficient"
    end
    
  end
  
  def calculate(num)
    total = 0

    (num - 1).downto(1) do |n|
      total += n if num % n == 0
    end
    
    total
  end 
     
end