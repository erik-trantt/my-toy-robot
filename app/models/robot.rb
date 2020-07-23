# class Robot
class Robot
  attr_reader :errors, :pos_x, :pos_y, :facing

  def initialize(table, attributes = {})
    @table = table
    place(attributes)
  end

  # def place(attributes)
  #    Assign position (x,y) and facing direction for the robot
  #    Assign all instance variables to +nil+ if no information is provided
  def place(attributes)
    @pos_x = attributes[:pos_x] || nil
    @pos_y = attributes[:pos_y] || nil
    @facing = attributes[:facing] || nil
  end

  # def report_position
  #    Return the robot's position and facing direction in format of "X,Y,Direction"
  #    Return "Not in place" if the robot has not been placed on table
  def report_position
    return 'Not in place' unless placed?

    "#{@pos_x},#{@pos_y},#{@facing}"
  end

  # def placed?
  #   Check if the robot knows its position on the table and facing direction
  def placed?
    !(@pos_x && @pos_y && @facing).nil?
  end

  def move
    case @facing
    when @table.directions[:north] then move_north
    when @table.directions[:east] then move_east
    when @table.directions[:south] then move_south
    when @table.directions[:west] then move_west
    end
  end

  def turn_right
    turn
  end

  def turn_left
    clockwise = false
    turn(clockwise)
  end

  def attributes
    {
      pos_x: @pos_x,
      pos_y: @pos_y,
      facing: @facing
    }
  end

  private

  def turn(clockwise = true)
    modifier = 1
    modifier *= -1 unless clockwise == true
    directions = @table.directions.values
    original_direction_value = directions.index(@facing)
    new_direction_value = (original_direction_value + modifier) % 4
    @facing = directions[new_direction_value]
  end

  def move_north
    @pos_y += 1
  end

  def move_south
    @pos_y -= 1
  end

  def move_west
    @pos_x -= 1
  end

  def move_east
    @pos_x += 1
  end
end
