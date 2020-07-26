##
# class RightCommand
class RightCommand
  def initialize(robot)
    @robot = robot
  end

  ##
  # This method will make a robot turn right
  #
  # Conditions:
  #     will do nothing if robot is not placed
  def execute
    return unless @robot.placed?

    @robot.position.turn_right
  end
end
