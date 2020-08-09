# require 'minitest/autorun'
require_relative '../test_helper'
require_relative '../../app/models/robot'
require_relative '../../app/models/table'

Minitest::Test.make_my_diffs_pretty!

describe Robot, "#initialize" do
  it 'position is nil when initialized' do
    robot = Robot.new
    actual = robot.position
    expected = nil

    _(actual).must_be_same_as expected
  end
end

describe Robot, "#placed?" do
  before do
    @position = nil
  end

  let (:actual) { Robot.new(@position).placed? }

  it 'return true if position is an instance of Position' do
    @position = Position.new(1, 3, 'NORTH')

    expected = true

    _(actual).must_be_same_as expected
  end

  it 'return false if position is nil' do
    @position = nil

    expected = false

    _(actual).must_be_same_as expected
  end
end

describe Robot, '#report_position' do
  before do
    @position = nil
  end

  let (:actual) { Robot.new(@position).report_position }

  it 'return "Not in place" when robot is just initalized & position is nothing' do
    @position = nil

    expected = 'Not in place'

    _(actual).must_equal expected
  end

  it 'return "Not in place" when position is nothing' do
    @position = Position.new(1, 3, 'NORTH')

    expected = '1,3,NORTH'

    _(actual).must_equal expected
  end
end
