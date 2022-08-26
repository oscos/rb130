class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new if invalid?
  end

  def kind
    arr_count = sides.uniq.size

    triangle_type = 
      if arr_count == 3 then "scalene"
      elsif arr_count == 2 then "isosceles"
      else "equilateral"
      end
      
    triangle_type
  end

  def invalid? 
    sides.min <= 0 ||
    sides[0] + sides[1] <= sides[2] ||
    sides[1] + sides[2] <= sides[0] ||
    sides[0] + sides[2] <= sides[1]
  end

end