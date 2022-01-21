=begin
Launch School: RB130 - Ruby/JavaScript Challenges > Medium Challenges
ExerciseName: []()
FileName: medium_challenges_x03.rb
Answered On: 01/17/2022
=end

class Clock
  attr_accessor :hr, :min, :total_min
  
  MIN_PER_HOUR = 60
  MIN_PER_DAY  = 60 * 24
  
  def initialize(hr, min)
    @hr = hr
    @min = min
    @total_min = ((hr * MIN_PER_HOUR) + min)
  end
  
  def self.at(hr, min=0)
    Clock.new(hr, min)
  end
  
  def -(num)
    calc_hr_min(total_min - num)
  end
  
  def +(num)
    calc_hr_min(total_min + num)
  end
  
  def ==(other_obj)
    total_min == other_obj.total_min
  end

  def to_s
    format("%02d:%02d", hr, min)
  end
  
  private 
  
  def calc_hr_min(num)
    var1 = num <= 0 ? MIN_PER_DAY + num : num
    var2 = var1 % MIN_PER_DAY
    hr, min = var2.divmod(MIN_PER_HOUR)
    Clock.new(hr, min)
  end
  
end