##
# class PlaceCommand
class PlaceCommand
  def initialize(table, robot, position)
    @table = table
    @robot = robot
    @position = position
  end

  ##
  # This method will put the robot to a given position.
  # CONDITION:
  #     assign if given position is valid
  #     if not valid, nothing happens
  def execute
    @robot.position = @position if @table.position_valid?(@position)
  end
end
