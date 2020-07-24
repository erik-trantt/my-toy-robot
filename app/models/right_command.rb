# class RightCommand
class RightCommand
  def initialize(robot)
    @robot = robot
  end

  def execute
    return unless @robot.placed?

    @robot.position.turn_right
  end
end
