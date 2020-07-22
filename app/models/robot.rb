class Robot
  def initialize(attributes = {})
    place(attributes)
  end

  def place(attributes)
    @pos_x = attributes[:position_x] || 0
    @pos_y = attributes[:position_y] || 0
    @direction = attributes[:direction] ||
  end

  def left; end

  def right; end

  def move; end

  def report; end
end
