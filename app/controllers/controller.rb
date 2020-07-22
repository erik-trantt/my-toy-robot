require_relative '../views/view'

# class Controller
# app controller
class Controller
  def initialize(table, robot)
    @table = table
    @robot = robot
    @view = View.new
  end

  def move
    handle_move
  end

  def left
    @robot.turn_left
  end

  def right
    @robot.turn_right
  end

  def report
    @view.display_position(@robot)
  end

  def place(attributes)
    unless valid_position?(attributes)
      @view.notify_invalid(errors(attributes).join("\n"))
      return
    end

    @robot.place(attributes)
  end

  def valid_position?(attributes)
    @table.within_ranges?(attributes[:pos_x], attributes[:pos_y]) && @table.valid_direction?(attributes[:facing])
  end

  def valid_robot?
    @robot.attributes? && valid_position?(@robot.attributes)
  end

  private

  def handle_move
    original_attributes = @robot.attributes
    @robot.move
    place(original_attributes) unless valid_robot?
  end

  def errors(attributes)
    pos_x = attributes[:pos_x]
    pos_y = attributes[:pos_y]
    facing = attributes[:facing]

    messages = []
    messages << 'Position is not on the table.' unless @table.within_ranges?(pos_x, pos_y)
    messages << "Direction is not #{@table.directions.values.join(', ')}." unless @table.valid_direction?(facing)
    messages
  end
end
