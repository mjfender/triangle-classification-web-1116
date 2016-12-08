require 'pry'

class Triangle
  # write code here
  attr_accessor :kind, :side_one, :side_two, :side_three, :all_sides, :sides_array
 

  def initialize(side_one, side_two, side_three)
    @sides_array = [side_one, side_two, side_three].sort!    
  end

  def valid?
    if sides_array[2] >= sides_array[0] + sides_array[1] || sides_array[0] <= sides_array[2] - sides_array[1]
      # begin
        raise TriangleError
        # rescue TriangleError => error
        # puts error.message
      # end
    elsif sides_array.any?{|e| e <= 0} 
      # begin
        raise TriangleError
        # rescue TriangleError => error
        #     puts error.message_zero
      # end
    else
      true
    end
  end
  # The third important property of triangles is the triangle inequality rule, which states: the length of a side of a triangle is less than the sum of the lengths of the other two sides and greater than the difference of the lengths of the other two sides.
  

  def kind
  # based on side lengths, returns type
  # :equilateral (sides equal) :isosceles () :scalene
    if valid?
      if sides_array[0] == sides_array[1] && sides_array[1] == sides_array[2]
        :equilateral
      elsif sides_array[1] == sides_array[2]
        :isosceles
      else 
        :scalene
      end
    else
      begin
        raise TriangleError
        rescue TriangleError => error
          puts error.message
      end
    end
  end
end

class TriangleError < StandardError
  # triangle error code

    def message 
      "you must create the triangle with valid side lengths!"
    end

    def message_zero
      "your triangle may not have sides with lengths less than or equal to 0"
    end
end
