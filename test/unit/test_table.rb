# require 'minitest/autorun'
require_relative '../test_helper'
require_relative '../../app/models/table'
require_relative '../../app/models/position'

describe Table, '#initialize' do
  it 'table is square' do
    table = Table.new(5, 5)
    expected = true

    _(table.length == table.width).must_be_same_as expected
  end
end

describe Table, '#position_valid?' do
  before do
    @table = Table.new(5, 5)
  end

  it 'return true when 0 <= X, Y < 5' do
    position = Position.new(2, 3, 'NORTH')
    actual = @table.position_valid?(position)
    expected = true

    _(actual).must_be_same_as expected
  end

  it 'return false when X is too big' do
    position = Position.new(6, 3, 'NORTH')
    actual = @table.position_valid?(position)
    expected = false

    _(actual).must_be_same_as expected
  end

  it 'return false when X is negative' do
    position = Position.new(-2, 3, 'NORTH')
    actual = @table.position_valid?(position)
    expected = false

    _(actual).must_be_same_as expected
  end

  it 'return false when Y is too big' do
    position = Position.new(2, 8, 'NORTH')
    actual = @table.position_valid?(position)
    expected = false

    _(actual).must_be_same_as expected
  end

  it 'return false when X is negative' do
    position = Position.new(2, -3, 'NORTH')
    actual = @table.position_valid?(position)
    expected = false

    _(actual).must_be_same_as expected
  end

  it 'return false when X, Y is too big' do
    position = Position.new(6, 8, 'NORTH')
    actual = @table.position_valid?(position)
    expected = false

    _(actual).must_be_same_as expected
  end

  it 'return false when X, Y is negative' do
    position = Position.new(-2, -3, 'NORTH')
    actual = @table.position_valid?(position)
    expected = false

    _(actual).must_be_same_as expected
  end
end
