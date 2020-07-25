require_relative '../models/position'
require_relative '../models/place_command'
require_relative '../models/move_command'
require_relative '../models/left_command'
require_relative '../models/right_command'
require_relative '../models/report_command'

# class Controller
# app controller
class CommandFactory
  PLACE_COMMAND_PATTERN = /^PLACE (\d),(\d),(NORTH|SOUTH|EAST|WEST)$/.freeze

  def initialize(table, robot)
    @table = table
    @robot = robot
  end

  def parse(input)
    case input
    when PLACE_COMMAND_PATTERN then
      # destructuring array into variables: X, Y, facing direction
      _input, x, y, facing = input.match(PLACE_COMMAND_PATTERN).to_a
      PlaceCommand.new(@table, @robot, Position.new(x.to_i, y.to_i, facing))
    when 'MOVE' then MoveCommand.new(@table, @robot)
    when 'LEFT' then LeftCommand.new(@robot)
    when 'RIGHT' then RightCommand.new(@robot)
    when 'REPORT' then ReportCommand.new(@robot)
    end
  end
end
