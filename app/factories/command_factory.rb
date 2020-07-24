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

  def parse(input)
    command = nil

    case input
    when /^PLACE/ then
      pattern = /^PLACE (\d),(\d),(NORTH|SOUTH|EAST|WEST)$/
      _input, x, y, facing = input.match(pattern).to_a
      command = PlaceCommand.new(@table, @robot, Position.new(x.to_i, y.to_i, facing))
    when 'MOVE' then command = MoveCommand.new(@table, @robot)
    when 'LEFT' then command = LeftCommand.new(@robot)
    when 'RIGHT' then command = RightCommand.new(@robot)
    when 'REPORT' then command = ReportCommand.new(@robot)
    end

    command
  end
end
