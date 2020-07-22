# class Router
class Router
  def initialize(controller)
    @controller = controller
    @placed = false
  end

  def run
    display_menu_header
    display_menu_commands(false)

    loop do
      print '> '
      command = gets.chomp.strip
      route_actions(command)
    end
  end

  private

  def display_menu_commands(display_full_menu = false)
    puts "\nPlease use one of the folllowing command(s):"
    menu_place_command
    menu_other_commands if display_full_menu
  end

  def display_menu_header
    puts 'Toy Robot Simulator'
    puts '==================='
  end

  def menu_place_command
    puts 'PLACE X,Y,F'
  end

  def menu_other_commands
    puts 'MOVE'
    puts 'LEFT'
    puts 'RIGHT'
    puts 'REPORT'
  end

  def route_actions(command)
    if @controller.valid_robot?
      route_full_actions(command)
    else
      route_place_action(command)
    end
  end

  def route_place_action(command)
    case command
    when /^PLACE/ then handle_place_command(command)
    else
      handle_invalid_command
    end
  end

  def route_full_actions(command)
    case command
    when 'MOVE' then @controller.move
    when 'LEFT' then @controller.left
    when 'RIGHT' then @controller.right
    when 'REPORT' then @controller.report
    when /^PLACE/ then handle_place_command(command)
    else
      handle_invalid_command
    end
  end

  def handle_place_command(command)
    pattern = /PLACE (\d,\d,(NORTH|SOUTH|WEST|EAST))/
    unless command.match?(pattern)
      print 'Invalid PLACE command. Correct format is '
      menu_place_command
      return
    end

    position = command.match(pattern)[1].split(',')
    @controller.place(pos_x: position[0].to_i, pos_y: position[1].to_i, facing: position[2])
  end

  def handle_invalid_command
    puts 'Invalid command. Please try again.'
    display_menu_commands(@controller.valid_robot?)
  end
end
