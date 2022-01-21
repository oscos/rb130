=begin
Launch School: RB130 - Ruby/JavaScript Challenges > Medium Challenges
ExerciseName: []()
FileName: medium_challenges_x03.rb
Answered On: 01/17/2022
=end

class Robot 
  @@past_names = []
  
  def initialize
    @name = unique_name
  end
  
  def reset
    @@past_names.delete(@name)
    @name = unique_name
  end
  
  def name
    @name
  end
  
  def past_names
    @@past_names
  end
  
  private
  
  def unique_name
    name = name_generator
    unless @@past_names.include?(name) == false
      name = name_generator
    end
    @@past_names << name
    name
  end

  def name_generator
    name = ''
    name += ("A".."Z").to_a.sample(2).join
    name += (0..9).to_a.sample(3).map(&:to_s).join
  end
  
end