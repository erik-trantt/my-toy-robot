class Table
  attr_reader :border_left, :border_right, :border_top, :border_bottom

  def initialize(size, robot = nil)
    @border_left    = 0
    @border_right   = size
    @border_top     = size
    @border_bottom  = 0
    @robot = robot
  end

  def robot_within_boundary?
    return unless has_robot?

    robot_within_horizontal_range? && robot_within_vertial_range?
  end

  def has_robot?
    !@robot.nil?
  end

  def robot_within_horizontal_range?
    @border_left < @robot.position_x && @robot.position_x < @border_right
  end

  def robot_within_vertial_range?
    @border_bottom < @robot.position_y && @robot.position_y < @border_top
  end
end
