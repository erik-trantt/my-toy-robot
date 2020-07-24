# class Table
class Table
  attr_reader :length, :width
  def initialize(width, length)
    @length = length
    @width = width
  end

  def position_valid?(position)
    within_horizontal_range?(position.x) && within_vertical_range?(position.y)
  end

  private

  def within_horizontal_range?(pos_x)
    0 <= pos_x && pos_x < @length
  end

  def within_vertical_range?(pos_y)
    0 <= pos_y && pos_y < @width
  end
end
