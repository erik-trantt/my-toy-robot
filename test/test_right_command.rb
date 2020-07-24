require 'minitest/autorun'
require_relative '../app/models/right_command'
require_relative '../app/models/place_command'
require_relative '../app/models/table'
require_relative '../app/models/robot'
require_relative '../app/models/position'

describe RightCommand, '#execute' do

  before do
    @table = Table.new(5, 5)
    @robot = Robot.new
  end

  it 'turn EAST when facing NORTH' do
    position = Position.new(1, 1, 'NORTH')
    PlaceCommand.new(@table, @robot, position).execute
    RightCommand.new(@robot).execute

    actual = @robot.report_position
    expected = '1,1,EAST'

    _(actual).must_equal expected
  end

  it 'turn SOUTH when facing EAST' do
    position = Position.new(1, 1, 'EAST')
    PlaceCommand.new(@table, @robot, position).execute
    RightCommand.new(@robot).execute

    actual = @robot.report_position
    expected = '1,1,SOUTH'
    
    _(actual).must_equal expected
  end

  it 'turn WEST when facing SOUTH' do
    position = Position.new(1, 1, 'SOUTH')
    PlaceCommand.new(@table, @robot, position).execute
    RightCommand.new(@robot).execute

    actual = @robot.report_position
    expected = '1,1,WEST'

    _(actual).must_equal expected
  end
  
  it 'turn NORTH when facing WEST' do
    position = Position.new(1, 1, 'WEST')
    PlaceCommand.new(@table, @robot, position).execute
    RightCommand.new(@robot).execute

    actual = @robot.report_position
    expected = '1,1,NORTH'

    _(actual).must_equal expected
  end
  
  it 'turn 1 times to EAST when facing NORTH' do
    position = Position.new(1, 1, 'NORTH')
    PlaceCommand.new(@table, @robot, position).execute
    1.times { RightCommand.new(@robot).execute }

    actual = @robot.report_position
    expected = '1,1,EAST'

    _(actual).must_equal expected
  end
  
  it 'turn 2 times to SOUTH when facing NORTH' do
    position = Position.new(1, 1, 'NORTH')
    PlaceCommand.new(@table, @robot, position).execute
    2.times { RightCommand.new(@robot).execute }

    actual = @robot.report_position
    expected = '1,1,SOUTH'

    _(actual).must_equal expected
  end
  
  it 'turn 3 times to WEST when facing NORTH' do
    position = Position.new(1, 1, 'NORTH')
    PlaceCommand.new(@table, @robot, position).execute
    3.times { RightCommand.new(@robot).execute }

    actual = @robot.report_position
    expected = '1,1,WEST'

    _(actual).must_equal expected
  end
  
  it 'turn 4 times to NORTH when facing NORTH' do
    position = Position.new(1, 1, 'NORTH')
    PlaceCommand.new(@table, @robot, position).execute
    4.times { RightCommand.new(@robot).execute }

    actual = @robot.report_position
    expected = '1,1,NORTH'

    _(actual).must_equal expected
  end

end
