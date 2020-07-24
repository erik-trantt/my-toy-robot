require_relative '../models/place_command'
require_relative '../models/move_command'
require_relative '../models/left_command'
require_relative '../models/right_command'
require_relative '../models/report_command'

# class Controller
# app controller
class CommandFactory
  def initialize(table, robot)
    @table = table
    @robot = robot
  end

  def parse(command)
    case command
    when /^PLACE/ then
      pattern = /^PLACE (\d),(\d),(NORTH|SOUTH|EAST|WEST)$/
      _command, x, y, facing = command.match(pattern).to_a
      PlaceCommand.new(@table, @robot, Position.new(x.to_i, y.to_i, facing))
    when 'MOVE' then MoveCommand.new(@table, @robot)
    when 'LEFT' then LeftCommand.new(@robot)
    when 'RIGHT' then RightCommand.new(@robot)
    when 'REPORT' then ReportCommand.new(@robot)
    end
  end
end
