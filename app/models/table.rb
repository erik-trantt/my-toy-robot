# class Table
class Table
  attr_reader :border_left, :border_right, :border_top, :border_bottom, :directions
  attr_writer :robot

  def initialize(length, width)
    @border_left    = 0
    @border_right   = length
    @border_top     = width
    @border_bottom  = 0
    @directions     = { north: 'NORTH', east: 'EAST', south: 'SOUTH', west: 'WEST' }.freeze
  end

  def within_ranges?(pos_x, pos_y)
    within_horizontal_range?(pos_x) && within_vertical_range?(pos_y)
  end

  def valid_direction?(direction)
    @directions.values.include?(direction)
  end

  private

  def within_horizontal_range?(pos_x)
    @border_left <= pos_x && pos_x < @border_right
  end

  def within_vertical_range?(pos_y)
    @border_bottom <= pos_y && pos_y < @border_top
  end
end
