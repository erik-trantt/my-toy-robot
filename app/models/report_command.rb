# class ReportCommand
class ReportCommand
  def initialize(robot)
    @robot = robot
  end

  def execute
    return unless @robot.placed?

    puts @robot.report_position
  end
end
