##
# class Robot
class Robot
  attr_accessor :position

  def initialize(position = nil)
    @position = position
  end

  ##
  # Check if the robot is placed on the Table
  #     return true when position attribute is assigned to an instance of Position
  #     return false when position attribute is nothing / nil
  def placed?
    !@position.nil?
  end

  ##
  # Tell the current position of robot in string format
  #     return "Not in place" when robot is not placed
  #     return a string in format "X,Y,F" when robot is placed
  def report_position
    return 'Not in place' unless placed?

    @position.to_h.values.join(',')
  end
end
