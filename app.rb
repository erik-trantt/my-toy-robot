require_relative 'app/factories/command_factory'
require_relative 'app/models/table'
require_relative 'app/models/robot'

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

  # generate command from user input
  command = factory.parse(input)
  # execute command if command is valid
  command&.execute
end
