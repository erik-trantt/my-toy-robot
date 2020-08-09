# require 'minitest/autorun'
require_relative '../test_helper'
require_relative '../../app/models/move_command'
require_relative '../../app/models/place_command'
require_relative '../../app/models/table'
require_relative '../../app/models/robot'
require_relative '../../app/models/position'

# cases that MoveCommand will ignore
describe MoveCommand, '#execute ignored cases' do

  before do
    @table = Table.new(5, 5)
    @robot = Robot.new
  end

  it 'ignore MOVE command when position is nothing' do
    PlaceCommand.new(@table, @robot, nil).execute
    move_command = MoveCommand.new(@table, @robot)
    move_command.execute

    actual = @robot.report_position
    expected = 'Not in place'

    _(actual).must_equal expected
  end

  it 'ignore MOVE command when position is INVALID' do
    PlaceCommand.new(@table, @robot, Position.new(1, -3, 'NORTH')).execute
    move_command = MoveCommand.new(@table, @robot)
    move_command.execute

    actual = @robot.report_position
    expected = 'Not in place'

    _(actual).must_equal expected
  end
  
  # MoveCommand will be ignored when moving outside of table edges
  describe 'at table edges' do

    it 'do not increase Y when moving to NORTH side' do
      @robot.position = Position.new(1, 4, 'NORTH')
      move_command = MoveCommand.new(@table, @robot)
      move_command.execute

      actual = @robot.report_position
      expected = '1,4,NORTH'

      _(actual).must_equal expected
    end

    it 'do not increase X when moving to EAST side' do
      @robot.position = Position.new(4, 3, 'EAST')
      move_command = MoveCommand.new(@table, @robot)
      move_command.execute

      actual = @robot.report_position
      expected = '4,3,EAST'

      _(actual).must_equal expected
    end

    it 'do not reduce Y when moving to SOUTH side' do
      @robot.position = Position.new(1, 0, 'SOUTH')
      move_command = MoveCommand.new(@table, @robot)
      move_command.execute

      actual = @robot.report_position
      expected = '1,0,SOUTH'

      _(actual).must_equal expected
    end

    it 'do not reduce X when moving to WEST side' do
      @robot.position = Position.new(0, 3, 'WEST')
      move_command = MoveCommand.new(@table, @robot)
      move_command.execute

      actual = @robot.report_position
      expected = '0,3,WEST'

      _(actual).must_equal expected
    end

  end

end

# cases when MoveCommand will work
describe MoveCommand, '#execute valid cases' do

  before do
    @table = Table.new(5, 5)
    @robot = Robot.new
  end

  it 'increase Y when moving NORTH' do
    @robot.position = Position.new(1, 3, 'NORTH')
    move_command = MoveCommand.new(@table, @robot)
    move_command.execute

    actual = @robot.report_position
    expected = '1,4,NORTH'

    _(actual).must_equal expected
  end

  it 'increase X when moving EAST' do
    @robot.position = Position.new(1, 3, 'EAST')
    move_command = MoveCommand.new(@table, @robot)
    move_command.execute

    actual = @robot.report_position
    expected = '2,3,EAST'

    _(actual).must_equal expected
  end

  it 'reduce Y when moving SOUTH' do
    @robot.position = Position.new(1, 3, 'SOUTH')
    move_command = MoveCommand.new(@table, @robot)
    move_command.execute

    actual = @robot.report_position
    expected = '1,2,SOUTH'

    _(actual).must_equal expected
  end

  it 'reduce X when moving WEST' do
    @robot.position = Position.new(1, 3, 'WEST')
    move_command = MoveCommand.new(@table, @robot)
    move_command.execute

    actual = @robot.report_position
    expected = '0,3,WEST'

    _(actual).must_equal expected
  end

  it 'return nil (ignore MoveCommand) if position is nothing' do
    move_command = MoveCommand.new(@table, @robot)
    
    actual = move_command.execute

    _(actual).must_be_nil
  end
end
