=begin
Launch School: RB130 - Ruby/JavaScript Challenges > Easy Challenges
ExerciseName: []()
FileName: easy_challenges_x04.rb
Answered On: 01/12/2022
=end

# def anagram(str, arr)
#   str_arr = str.chars.sort.join
#   arr.group_by { |el| el.chars.sort.join }
#     .fetch(str_arr)
# end

# str = 'master'
# arr = %w(stream pigeon maters)
# p anagram(str, arr)

class Anagram
  attr_accessor :word
  
  def initialize(word)
    @word = word
  end
  
  def match(arr)
    arr.group_by { |el| rearrange(el) if el.downcase != word.downcase}
      .fetch(rearrange(word), [])
  end
  
  private
  
  def rearrange(w)
    w.downcase.chars.sort.join
  end

end

# detector = Anagram.new('diaper')
# detector.match(%w(hello world zombies pants))