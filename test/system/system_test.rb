# require 'minitest/autorun'
require_relative '../test_helper'
require_relative '../data/file_helper'
require_relative '../data/output_helper'
require_relative '../../app/factories/command_factory'
require_relative '../../app/models/table'
require_relative '../../app/models/robot'

describe "System Test" do

  before do
    table = Table.new(5, 5)
    robot = Robot.new
    @factory = CommandFactory.new(table, robot)
    @input_file = ''
  end

  let (:inputs) { FileHelper.readlines_to_array(@input_file) }
  let (:actual) { OutputHelper.capture_output(@factory, inputs) }

  describe 'Example #a' do
    
    it 'return "0,1,NORTH\n"' do
      @input_file = 'test/data/test_data_example_a.txt'
      expected = "0,1,NORTH\n"

      _(actual).must_equal expected
    end
  end

  describe 'Example #b' do
    
    it 'return "0,0,WEST\n"' do
      @input_file = 'test/data/test_data_example_b.txt'
      expected = "0,0,WEST\n"

      _(actual).must_equal expected
    end
  end

  describe 'Example #c' do
    
    it 'return "3,3,NORTH\n"' do
      @input_file = 'test/data/test_data_example_c.txt'
      expected = "3,3,NORTH\n"

      _(actual).must_equal expected
    end
  end

  describe 'Example #d' do
    
    it 'from "0,0,NORTH" move 5 times then return "0,4,NORTH\n"' do
      @input_file = 'test/data/test_data_example_d.txt'
      expected = "0,4,NORTH\n"

      _(actual).must_equal expected
    end
  end

  describe 'Example #e' do
    
    it 'from "0,0,EAST" move 2 times, turn left, move 4 times, then return "2,4,NORTH\n"' do
      @input_file = 'test/data/test_data_example_e.txt'
      expected = "2,4,NORTH\n"

      _(actual).must_equal expected
    end
  end

  describe 'Example #f' do
    
    it 'from "2,2,SOUTH" move 3 times, turn right, move 3 times, then return "0,0,WEST\n"' do
      @input_file = 'test/data/test_data_example_f.txt'
      expected = "2,0,SOUTH\n0,0,WEST\n"

      _(actual).must_equal expected
    end
  end
  
end
