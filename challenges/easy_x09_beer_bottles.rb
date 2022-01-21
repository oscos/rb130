=begin
Launch School: RB130 - Ruby/JavaScript Challenges > Easy Challenges
ExerciseName: []()
FileName: easy_challenges_x09.rb
Answered On: 01/13/2022
=end

class BeerSong
  
  BOTTLE2 = <<-SONG
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.

    SONG
  
  BOTTLE1 = <<-SONG
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.

    SONG
  
  BOTTLE0 = <<-SONG
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.

    SONG
  
  def self.verse (*nums)
    process_lyrics(*nums)
  end

  def self.verses (*nums)
    process_lyrics(*nums)
  end

  def self.lyrics
    nums = (0..99).to_a.reverse
    process_lyrics(*nums)
  end

  private  

  def self.process_lyrics (*nums)
    num_arr = (nums[-1]..nums[0]).to_a.reverse

    result = ""

    num_arr.each do |n|
      if n == 2
        result += BOTTLE2
      elsif n == 1
        result += BOTTLE1
      elsif n == 0
        result += BOTTLE0
      else
        result += <<-SONG
#{n} bottles of beer on the wall, #{n} bottles of beer.
Take one down and pass it around, #{(n - 1)} bottles of beer on the wall.

        SONG
      end
    end

    result.delete_suffix!("\n")
  end
  
end