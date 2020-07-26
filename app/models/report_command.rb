##
# class ReportCommand
class ReportCommand
  def initialize(robot)
    @robot = robot
  end

  ##
  # This method will return a robot's position as a string
  #
  # Conditions:
  #     will do nothing if robot is not placed
  def execute
    return unless @robot.placed?

    puts @robot.report_position
  end
end
