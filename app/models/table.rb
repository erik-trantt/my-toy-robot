##
# class Table
class Table
  attr_reader :length, :width

  def initialize(width, length)
    @length = length
    @width = width
  end

  ##
  # Check if a given position is valid, by comparing against these criteria:
  #     position is not nil, and
  #     0 <= X < length, and
  #     0 <= Y < width
  def position_valid?(position)
    !position.nil? &&
      within_horizontal_range?(position.x) &&
      within_vertical_range?(position.y)
  end

  private

  def within_horizontal_range?(pos_x)
    0 <= pos_x && pos_x < @length
  end

  def within_vertical_range?(pos_y)
    0 <= pos_y && pos_y < @width
  end
end
