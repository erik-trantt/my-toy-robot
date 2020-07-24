require 'minitest/autorun'
require_relative '../app/models/report_command'
require_relative '../app/models/robot'
require_relative '../app/models/position'

describe ReportCommand, '#execute' do
  before do
    @robot = Robot.new
    @table = Table.new(5, 5)
  end

  it 'return position as text with a VALID position' do
    position = Position.new(1, 3, 'NORTH')
    place_command = PlaceCommand.new(@table, @robot, position)
    place_command.execute

    report_command = ReportCommand.new(@robot)
    expected = "1,3,NORTH\n"

    _{report_command.execute}.must_output expected
  end

  it 'return "Not in place" with an INVALID position' do
    invalid_position = Position.new(1, -3, 'NORTH')
    place_command = PlaceCommand.new(@table, @robot, invalid_position)
    place_command.execute

    report_command = ReportCommand.new(@robot)
    expected = "Not in place\n"

    _{report_command.execute}.must_output expected
  end
end
