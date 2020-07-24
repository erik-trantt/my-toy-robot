# class Position
class Position
  attr_accessor :x, :y, :facing

  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize(pos_x, pos_y, facing)
    @x = pos_x
    @y = pos_y
    @facing = facing
  end

  def move
    case @facing.downcase.to_sym
    when :north then move_north
    when :east then move_east
    when :south then move_south
    when :west then move_west
    end
  end

  def turn_left
    @facing = direction_after_turn(:left)
  end

  def turn_right
    @facing = direction_after_turn(:right)
  end

  def ==(other)
    @x == other.x && @y == other.y && @facing == other.facing
  end

  def to_h
    {
      x: @x,
      y: @y,
      facing: @facing
    }
  end

  private

  def direction_after_turn(left_or_right)
    modifier = 1
    modifier = -1 if left_or_right == :left

    DIRECTIONS[(DIRECTIONS.index(@facing) + modifier) % 4]
  end

  def move_north
    @y += 1
  end

  def move_south
    @y -= 1
  end

  def move_east
    @x += 1
  end

  def move_west
    @x -= 1
  end
end
