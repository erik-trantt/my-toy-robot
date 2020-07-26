##
# class LeftCommand
class LeftCommand
  def initialize(robot)
    @robot = robot
  end

  ##
  # This method will make a robot turn left
  #
  # Conditions:
  #     will do nothing if robot is not placed
  def execute
    return unless @robot.placed?

    @robot.position.turn_left
  end
end
