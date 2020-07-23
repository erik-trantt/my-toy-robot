require 'minitest/autorun'
require_relative '../../app/models/robot'
require_relative '../../app/models/table'

class TestRobot < Minitest::Test
  def setup
    @table = Table.new(5, 5)
    @robot = Robot.new(@table)
    @position = { pos_x: 2, pos_y: 3, facing: 'NORTH' }
  end

  def teardown; end

  def test_robot_is_not_placed
    # @robot = Robot.new(@table)
    expected = false

    assert_same expected, @robot.placed?
  end

  def test_robot_is_placed_on_table
    @robot.place(@position)
    expected = true

    assert_same expected, @robot.placed?
  end

  def test_robot_is_placed_out_of_boundaries
    # @robot = Robot.new(@table)
    invalid_position = { pos_x: 7, pos_y: -2, facing: 'NORTH' }
    @robot.place(invalid_position)
    expected = true

    assert_same expected, @robot.placed?
  end

  def test_robot_return_not_in_place_when_not_placed
    # @robot = Robot.new(@table)
    expected = 'Not in place'

    assert_equal expected, @robot.report_position
  end

  def test_report_position_return_valid_position
    # @robot = Robot.new(@table)
    @robot.place(@position)
    expected = '2,3,NORTH'

    assert_equal expected, @robot.report_position
  end
end
