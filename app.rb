require_relative 'app/factories/command_factory'
require_relative 'app/models/place_command'
require_relative 'app/models/move_command'
require_relative 'app/models/left_command'
require_relative 'app/models/right_command'
require_relative 'app/models/report_command'
require_relative 'app/models/table'
require_relative 'app/models/robot'
require_relative 'app/models/position'

# initializes a new 5x5 table, a new robot, and a new command factory
table = Table.new(5, 5)
robot = Robot.new
factory = CommandFactory.new(table, robot)

puts 'Toy robot simulator'
puts '==================='
puts 'Available commands:'
puts 'PLACE X,Y,F'
puts 'MOVE'
puts 'LEFT'
puts 'RIGHT'
puts 'REPORT'

loop do
  print '> '
  input = gets.chomp

  command = factory.parse(input)

  command&.execute
end
