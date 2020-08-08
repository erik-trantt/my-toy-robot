# require 'minitest/autorun'
require_relative '../test_helper'
require_relative '../../app/models/position'

describe Position, '#==' do
  it 'compare 2 position' do
    position = Position.new(1, 3, 'NORTH')
    expected = Position.new(1, 3, 'NORTH')

    _(position).must_equal expected
  end
end

describe Position, '#move' do
  it 'move 1 unit to NORTH' do
    position = Position.new(1, 3, 'NORTH')
    position.move
    expected_position = Position.new(1, 4, 'NORTH')

    _(position).must_equal expected_position
  end

  it 'move 1 unit to EAST' do
    position = Position.new(1, 3, 'EAST')
    position.move
    expected_position = Position.new(2, 3, 'EAST')

    _(position).must_equal expected_position
  end

  it 'move 1 unit to SOUTH' do
    position = Position.new(1, 3, 'SOUTH')
    position.move
    expected_position = Position.new(1, 2, 'SOUTH')

    _(position).must_equal expected_position
  end

  it 'move 1 unit to WEST' do
    position = Position.new(1, 3, 'WEST')
    position.move
    expected_position = Position.new(0, 3, 'WEST')

    _(position).must_equal expected_position
  end
end

describe Position, '#turn_left' do
  before do
    @position = Position.new(1, 3, 'NORTH')
  end

  it 'return WEST after turning from NORTH 1 times' do
    1.times { @position.turn_left }
    expected_position = Position.new(1, 3, 'WEST')

    _(@position).must_equal expected_position
  end

  it 'return SOUTH after turning from NORTH 2 times' do
    2.times { @position.turn_left }
    expected_position = Position.new(1, 3, 'SOUTH')

    _(@position).must_equal expected_position
  end

  it 'return EAST after turning from NORTH 3 times' do
    3.times { @position.turn_left }
    expected_position = Position.new(1, 3, 'EAST')

    _(@position).must_equal expected_position
  end

  it 'return NORTH after turning from NORTH 4 times' do
    4.times { @position.turn_left }
    expected_position = Position.new(1, 3, 'NORTH')

    _(@position).must_equal expected_position
  end
end

describe Position, '#turn_right' do
  before do
    @position = Position.new(1, 3, 'NORTH')
  end

  it 'return EAST after turning from NORTH 1 times' do
    1.times { @position.turn_right }
    expected_position = Position.new(1, 3, 'EAST')

    _(@position).must_equal expected_position
  end

  it 'return SOUTH after turning from NORTH 2 times' do
    2.times { @position.turn_right }
    expected_position = Position.new(1, 3, 'SOUTH')

    _(@position).must_equal expected_position
  end

  it 'return WEST after turning from NORTH 3 times' do
    3.times { @position.turn_right }
    expected_position = Position.new(1, 3, 'WEST')

    _(@position).must_equal expected_position
  end

  it 'return NORTH after turning from NORTH 4 times' do
    4.times { @position.turn_right }
    expected_position = Position.new(1, 3, 'NORTH')

    _(@position).must_equal expected_position
  end
end

describe Position, '#to_h' do
  before do
    @position = Position.new(1, 3, 'NORTH')
  end

  it 'return as a Hash' do
    actual = @position.to_h.class
    expected = Hash

    _(actual).must_be_same_as expected
  end

  it 'return the correct attributes' do
    actual = @position.to_h
    expected = { x: 1, y: 3, facing: 'NORTH' }

    _(actual).must_equal expected
  end
end

