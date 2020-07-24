# class LeftCommand
class LeftCommand
  def initialize(robot)
    @robot = robot
  end

  def execute
    return unless @robot.placed?

    @robot.position.turn_left
  end
end
