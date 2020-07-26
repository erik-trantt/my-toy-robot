##
# class MoveCommand
class MoveCommand
  def initialize(table, robot)
    @table = table
    @robot = robot
  end

  ##
  # This method will make a robot move towards its facing direction.
  # Before moving, check if the new position is a valid position on the table.
  # If valid, change to new position.
  # If not valid, make no change.
  #
  # Conditions:
  #     will do nothing if robot is not placed
  def execute
    return unless @robot.placed?

    original_position = @robot.position
    new_position = original_position.dup
    new_position.move

    @robot.position = new_position if @table.position_valid?(new_position)
  end
end
