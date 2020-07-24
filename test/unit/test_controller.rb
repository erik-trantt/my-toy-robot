require 'minitest/autorun'
require_relative '../../app/controllers/controller'
require_relative '../../app/models/robot'
require_relative '../../app/models/table'

describe Controller, "robot not on table" do
  before do
    @table = Table.new(5, 5)
    @robot = Robot.new(@table)

    @controller = Controller.new(@table, @robot)
  end

  it '#PLACE with a valid position is accepted' do
    position = { pos_x: 2, pos_y: 2, facing: 'NORTH' }
    expected = true
    @controller.place(position)

    _(@robot.placed?).must_equal expected
  end

  it '#PLACE with a invalid position is ingored' do
    invalid_position = { pos_x: 7, pos_y: -2, facing: 'NORTH' }
    expected = false
    @controller.place(invalid_position)

    _(@robot.placed?).must_equal expected
  end

  it '#MOVE is ignored' do
    expected = { pos_x: 2, pos_y: 2, facing: 'NORTH' }
    @controller.move
    _(@robot.attributes).wont_equal expected
  end

  it '#LEFT is ignored' do
    expected = { pos_x: 2, pos_y: 2, facing: 'NORTH' }
    @controller.left
    _(@robot.attributes).wont_equal expected
  end

  it '#RIGHT is ignored' do
    expected = { pos_x: 2, pos_y: 2, facing: 'NORTH' }
    @controller.right
    _(@robot.attributes).wont_equal expected
  end

  it '#REPORT returns "Not in place"' do
    expected = 'Not in place'
    @controller.move
    _(@robot.report_position).must_equal expected
  end
end
