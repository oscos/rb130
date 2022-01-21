=begin
Launch School: RB130 - Ruby/JavaScript Challenges > Easy Challenges
ExerciseName: []()
FileName: easy_challenges_x07_octal.rb
Answered On: 01/13/2022
=end


class Octal
  # attr_accessor :str
  
  def initialize(str)
    @str = str
  end
  
  def to_decimal
    valid = []
    valid_chars = ("0".."7").to_a    
    
    if @str.chars.all? { |n| valid_chars.include?(n) }
      @str.to_i.digits.each.with_index do |n, idx| 
        valid << n * (8**idx)
      end
    else
      return 0
    end

    valid.sum
  end

end