require 'minitest/autorun'
require_relative '../../app/models/place_command'
require_relative '../../app/models/table'
require_relative '../../app/models/robot'
require_relative '../../app/models/position'

describe PlaceCommand, '#execute' do
  before do
    @robot = Robot.new
    @table = Table.new(5, 5)
  end

  it 'place robot on table with VALID position' do
    position = Position.new(1, 3, 'NORTH')
    place_command = PlaceCommand.new(@table, @robot, position)
    place_command.execute

    actual = @robot.report_position
    expected = '1,3,NORTH'

    _(actual).must_equal expected
  end

  it 'will not place robot on table with INVALID position' do
    invalid_position = Position.new(1, -3, 'NORTH')
    place_command = PlaceCommand.new(@table, @robot, invalid_position)
    place_command.execute

    actual = @robot.report_position
    expected = 'Not in place'

    _(actual).must_equal expected
  end
end
