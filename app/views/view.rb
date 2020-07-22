# class View
class View
  def display_position(robot)
    puts robot.report_position
  end

  def display(message)
    puts message
  end

  def notify_invalid(message)
    puts "Invalid: #{message}"
  end
end
