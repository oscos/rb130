=begin
Launch School: RB130 - Ruby/JavaScript Challenges > Easy Challenges
ExerciseName: [Roman Numberals](https://launchschool.com/exercises/117c3255)
FileName: easy_challenges_x03_roman_numerals.rb
Answered On: 01/11/2022
=end


class RomanNumeral
  attr_accessor :number
  
  def initialize(number)
    @number = number
  end
  
  ROMAN_NUMERALS  = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def to_roman

    letter_result = ""
    number_result = number

    ROMAN_NUMERALS.each_pair do |k, v|
      whole = number_result / v  # number_result.divmod(v)[0]  
      letter_result += (k * whole)  if whole > 0
      number_result = (number_result % v)
      # p "#{k} : #{v} : #{whole} : #{number_result}"
    end

     letter_result
  end

end