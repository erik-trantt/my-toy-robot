# class MoveCommand
class MoveCommand
  def initialize(table, robot)
    @table = table
    @robot = robot
  end

  def execute
    return unless @robot.placed?

    original_position = @robot.position
    new_position = original_position.dup
    new_position.move

    @robot.position = new_position if @table.position_valid?(new_position)
  end
end
