=begin
Launch School: RB130 - Ruby/JavaScript Challenges > Easy Challenges
ExerciseName: []()
FileName: easy_challenges_x05.rb
Answered On: 01/12/2022
=end

class Scrabble
  attr_accessor :word
  
  def initialize(word)
    @word = word
  end
  

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    return 0 if word == "" || word.nil?
    
    word_value = 0

    word.chars.each do |el|
      word_value += check_value(el)
    end

    word_value
  end

  private
  
  def check_value(letter)
    hsh = {
      1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
      2 => ["D", "G"],
      3 => ["B", "C", "M", "P"],
      4 => ["F", "H", "V", "W", "Y"],
      5 => ["K"],
      8 => ["J", "X"],
      10 => ["Q", "Z"]
    }

    letter_value = 0

    hsh.each_pair do |k, v|
     letter_value += k if v.include?(letter.upcase)
    end

    letter_value
  end
  
end