require 'minitest/autorun'
require_relative '../../app/models/robot'
require_relative '../../app/models/table'

describe Robot, "#initialize" do
  it 'position is nill when initialized' do
    robot = Robot.new
    actual = robot.position
    expected = nil

    _(actual).must_be_same_as expected
  end
end

describe Robot, "#placed?" do
  it 'return true if position is an instance of Position' do
    position = Position.new(1, 3, 'NORTH')
    robot = Robot.new(position)
    actual = robot.placed?
    expected = true

    _(actual).must_be_same_as expected
  end

  it 'return false if position is nil' do
    position = nil
    robot = Robot.new(position)
    actual = robot.placed?
    expected = false

    _(actual).must_be_same_as expected
  end
end

describe Robot, '#report_position' do
  it 'return "Not in place" when robot is just initalized' do
    robot = Robot.new
    actual = robot.report_position
    expected = 'Not in place'

    _(actual).must_equal expected
  end

  it 'return "Not in place" when position is nothing' do
    position = nil
    robot = Robot.new(position)
    actual = robot.report_position
    expected = 'Not in place'

    _(actual).must_equal expected
  end

  it 'return "Not in place" when position is nothing' do
    position = Position.new(1, 3, 'NORTH')
    robot = Robot.new(position)
    actual = robot.report_position
    expected = '1,3,NORTH'

    _(actual).must_equal expected
  end
end
