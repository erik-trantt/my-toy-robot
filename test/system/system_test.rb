require 'minitest/autorun'
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
  end

  describe 'Example #a' do
    let (:input_file) { 'test/data/test_data_example_a.txt' }

    it 'return "0,1,NORTH\n"' do
      inputs = FileHelper.readlines_to_array(input_file)
      actual = OutputHelper.capture_output(@factory, inputs)

      expected = "0,1,NORTH\n"

      _(actual).must_equal expected
    end
  end

  describe 'Example #b' do
    let (:input_file) { 'test/data/test_data_example_b.txt' }

    it 'return "0,0,WEST\n"' do
      inputs = FileHelper.readlines_to_array(input_file)
      actual = OutputHelper.capture_output(@factory, inputs)

      expected = "0,0,WEST\n"

      _(actual).must_equal expected
    end
  end

  describe 'Example #c' do
    let (:input_file) { 'test/data/test_data_example_c.txt' }

    it 'return "3,3,NORTH\n"' do
      inputs = FileHelper.readlines_to_array(input_file)
      actual = OutputHelper.capture_output(@factory, inputs)

      expected = "3,3,NORTH\n"

      _(actual).must_equal expected
    end
  end

  describe 'Example #d' do
    let (:input_file) { 'test/data/test_data_example_d.txt' }

    it 'from "0,0,NORTH" move 5 times then return "0,4,NORTH\n"' do
      inputs = FileHelper.readlines_to_array(input_file)
      actual = OutputHelper.capture_output(@factory, inputs)

      expected = "0,4,NORTH\n"

      _(actual).must_equal expected
    end
  end

  describe 'Example #e' do
    let (:input_file) { 'test/data/test_data_example_e.txt' }

    it 'from "0,0,EAST" move 2 times, turn left, move 4 times, then return "2,4,NORTH\n"' do
      inputs = FileHelper.readlines_to_array(input_file)
      actual = OutputHelper.capture_output(@factory, inputs)

      expected = "2,4,NORTH\n"

      _(actual).must_equal expected
    end
  end

  describe 'Example #f' do
    let (:input_file) { 'test/data/test_data_example_f.txt' }

    it 'from "2,2,SOUTH" move 3 times, turn right, move 3 times, then return "0,0,WEST\n"' do
      inputs = FileHelper.readlines_to_array(input_file)
      actual = OutputHelper.capture_output(@factory, inputs)

      expected = "2,0,SOUTH\n0,0,WEST\n"

      _(actual).must_equal expected
    end
  end
  
end
