require 'minitest/autorun'
require_relative '../../app/models/table'

class TestTable < Minitest::Test
  def setup
    @table = Table.new(5, 5)
  end

  def teardown; end

  def test_table_knows_4_valid_directions
    directions_values = %w[NORTH EAST SOUTH WEST]
    directions_keys = %i[north east south west]

    assert_equal @table.directions.values, directions_values, 'Directions are in clockwise: NORTH EAST SOUTH WEST'
    assert_equal @table.directions.keys, directions_keys
  end

  def test_predefined_directions_is_hash
    assert_kind_of Hash, @table.directions
  end

  def test_predefined_directions_is_not_array
    refute_kind_of Array, @table.directions
  end

  def test_table_knows_give_direction_is_valid
    assert_same @table.valid_direction?('SOUTH'), true
  end

  def test_position_check_return_true_when_valid
    valid_position = { pos_x: 2, pos_y: 3, facing: 'NORTH' }

    assert_same @table.within_ranges?(valid_position[:pos_x], valid_position[:pos_y]), true
  end

  def test_position_return_false_when_x_is_too_big
    invalid_position = { pos_x: 7, pos_y: 3, facing: 'NORTH' }
    refute_same @table.within_ranges?(invalid_position[:pos_x], invalid_position[:pos_y]), true
  end

  def test_position_return_false_when_y_is_too_big
    invalid_position = { pos_x: 2, pos_y: 8, facing: 'NORTH' }
    refute_same @table.within_ranges?(invalid_position[:pos_x], invalid_position[:pos_y]), true
  end

  def test_position_return_false_when_x_is_negative
    invalid_position = { pos_x: -1, pos_y: 3, facing: 'NORTH' }
    refute_same @table.within_ranges?(invalid_position[:pos_x], invalid_position[:pos_y]), true
  end

  def test_position_return_false_when_y_is_negative
    invalid_position = { pos_x: 2, pos_y: -2, facing: 'NORTH' }
    refute_same @table.within_ranges?(invalid_position[:pos_x], invalid_position[:pos_y]), true
  end

  def test_position_return_false_when_x_y_are_negative
    invalid_position = { pos_x: -1, pos_y: -2, facing: 'NORTH' }
    refute_same @table.within_ranges?(invalid_position[:pos_x], invalid_position[:pos_y]), true
  end

  def test_position_return_false_when_x_y_are_to_big
    invalid_position = { pos_x: 7, pos_y: 8, facing: 'NORTH' }
    refute_same @table.within_ranges?(invalid_position[:pos_x], invalid_position[:pos_y]), true
  end
end
