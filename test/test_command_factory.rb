require 'minitest/autorun'
require_relative '../app/factories/command_factory'
require_relative '../app/models/place_command'
require_relative '../app/models/move_command'
require_relative '../app/models/left_command'
require_relative '../app/models/right_command'
require_relative '../app/models/report_command'
require_relative '../app/models/table'
require_relative '../app/models/robot'

describe CommandFactory, '#parse' do

  before do
    table = Table.new(5, 5)
    robot = Robot.new
    @factory = CommandFactory.new(table, robot)
  end
  
  it 'return nothing when user enters an empty string' do
    actual = @factory.parse("")
    _(actual).must_be_nil
  end

  it 'return nothing when user enters nothing' do
    actual = @factory.parse(nil)

    _(actual).must_be_nil
  end

  it 'return a MoveCommand when user enters "MOVE"' do
    actual = @factory.parse('MOVE')
    
    _(actual).must_be_kind_of MoveCommand
  end

  it 'return a LeftCommand when user enters "LEFT"' do
    actual = @factory.parse('LEFT')
    
    _(actual).must_be_kind_of LeftCommand
  end

  it 'return a RightCommand when user enters "RIGHT"' do
    actual = @factory.parse('RIGHT')
    
    _(actual).must_be_kind_of RightCommand
  end

  it 'return a ReportCommand when user enters "REPORT"' do
    actual = @factory.parse('REPORT')
    
    _(actual).must_be_kind_of ReportCommand
  end

  describe 'when user enters "PLACE"' do
    
    ### VALID CASES
    it 'return a PlaceCommand when user enters "PLACE 1,1,NORTH"' do
      actual = @factory.parse('PLACE 1,1,NORTH')
    
      _(actual).must_be_kind_of PlaceCommand  
    end
    
    it 'return a PlaceCommand when user enters "   PLACE 1,1,NORTH   "' do
      actual = @factory.parse('PLACE 1,1,NORTH')
    
      _(actual).must_be_kind_of PlaceCommand  
    end

    it 'return a PlaceCommand when user enters "PLACE 8,1,NORTH"' do
      actual = @factory.parse('PLACE 8,1,NORTH')
    
      _(actual).must_be_kind_of PlaceCommand  
    end
    
    ### EDGE CASES
    it 'return nothing when user enters negative X or Y, e.g. "PLACE -2,1,NORTH"' do
      actual = @factory.parse('PLACE -2,8,NORTH')
    
      _(actual).must_be_nil  
    end

    it 'return nothing when user enters direction other than NORTH, EAST, SOUTH or WEST, e.g. "PLACE 1,1,NORTHHHHH"' do
      actual = @factory.parse('PLACE 1,1,NORTHHHHH')
    
      _(actual).must_be_nil  
    end
    
    it 'return nothing when user enters "PLACE X,Y,F"' do
      actual = @factory.parse('PLACE X,Y,F')
    
      _(actual).must_be_nil 
    end

    it 'return nothing when user enters "PLACE"' do
      actual = @factory.parse('PLACE')
    
      _(actual).must_be_nil 
    end

    it 'return nothing when user enters "PLACE 1, 1, NORTH"' do
      actual = @factory.parse('PLACE 1, 1, NORTH')
    
      _(actual).must_be_nil 
    end

    it 'return nothing when user enters "PLACE ,1,NORTH"' do
      actual = @factory.parse('PLACE ,1,NORTH')
    
      _(actual).must_be_nil 
    end

    it 'return nothing when user enters "PLACE 1,,NORTH"' do
      actual = @factory.parse('PLACE 1,,NORTH')
    
      _(actual).must_be_nil 
    end

    it 'return nothing when user enters "PLACE 1,1,"' do
      actual = @factory.parse('PLACE 1,1,')
    
      _(actual).must_be_nil 
    end
    
  end

end
