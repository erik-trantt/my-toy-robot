##
# class Position
# on a 2 dimensional surface
# X is the horizontal position
# Y is the vertical position
#   (y)
#   ^
#   |
#   |
#   ------> (x)

# facing direction is either NORTH, EAST, SOUTH or WEST
#         NORTH
#          |
# WEST ----|----- EAST
#          |
#         SOUTH
class Position
  attr_accessor :x, :y, :facing

  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize(pos_x, pos_y, facing)
    @x = pos_x
    @y = pos_y
    @facing = facing
  end

  ##
  # This method check the @facing attribute for its current direction, then trigger the move action associating with that direction 
  def move
    case @facing.downcase.to_sym
    when :north then move_north
    when :east then move_east
    when :south then move_south
    when :west then move_west
    end
  end

  ##
  # This helps robot changes facing direction to its left side
  def turn_left
    @facing = direction_after_turn(:left)
  end

  ##
  # This helps robot changes facing direction to its right side
  def turn_right
    @facing = direction_after_turn(:right)
  end

  ##
  # This method helps comparing 2 instances of Position class.
  # Check if each attribute equal each of the other instance.
  def ==(other)
    @x == other.x && @y == other.y && @facing == other.facing
  end

  ##
  # This method will return a Position's attributes as a Hash
  def to_h
    {
      x: @x,
      y: @y,
      facing: @facing
    }
  end

  private

  ##
  # Support #left and #right methods to turn left or right from current facing direction.
  # INPUT:
  #     left_or_right is either :left or :right
  # OUTPUT:
  #     return a member of DIRECTIONS, which is to the left or right side
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
