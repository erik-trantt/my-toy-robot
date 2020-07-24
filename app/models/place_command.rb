# class PlaceCommand
class PlaceCommand
  def initialize(table, robot, position)
    @table = table
    @robot = robot
    @position = position
  end

  def execute
    @robot.position = @position if @table.position_valid?(@position)
  end
end
