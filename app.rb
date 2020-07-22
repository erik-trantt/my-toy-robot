# frozen_string_literal: true

require_relative './app/router'
require_relative './app/models/robot'
require_relative './app/models/table'
require_relative './app/controllers/controller'

table = Table.new(5, 5)
robot = Robot.new(table)

controller = Controller.new(table, robot)

router = Router.new(controller)

router.run
