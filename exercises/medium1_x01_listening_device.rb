=begin
Launch School: RB130 - Ruby Foundations: More Topics > Medium 1 > Listening Device
ExerciseName: [Listening Device](https://launchschool.com/exercises/56a87411)
FileName: medium1_x01_listening_device.rb
Answered On: 12/29/2021
=end


class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end
  
  def play
    puts @recordings[-1]
  end
  
  def listen
    record(yield) if block_given?
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"