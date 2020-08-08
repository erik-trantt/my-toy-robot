# require 'minitest/autorun'
require_relative '../test_helper'
require_relative '../../app/models/report_command'
require_relative '../../app/models/robot'
require_relative '../../app/models/position'

describe ReportCommand, '#execute' do
  before do
    @robot = Robot.new
    @table = Table.new(5, 5)
  end

  it 'return position as text with a VALID position' do
    position = Position.new(1, 3, 'NORTH')
    PlaceCommand.new(@table, @robot, position).execute

    report_command = ReportCommand.new(@robot)
    expected = "1,3,NORTH\n"

    _{report_command.execute}.must_output expected
  end

  it 'position does not change with an INVALID position' do
    position = Position.new(1, 3, 'NORTH')
    PlaceCommand.new(@table, @robot, position).execute

    invalid_position = Position.new(1, -3, 'NORTH')
    PlaceCommand.new(@table, @robot, invalid_position).execute

    report_command = ReportCommand.new(@robot)
    expected = "1,3,NORTH\n"

    _{report_command.execute}.must_output expected
  end

  it 'return nil (ignore ReportCommand) if position is nothing' do
    report_command = ReportCommand.new(@robot)
    
    actual = report_command.execute

    _(actual).must_be_nil
  end
end
