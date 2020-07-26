# Toy Robot Simulator

## Table of contents

- [Toy Robot Simulator](#toy-robot-simulator)
  - [Table of contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
    - [Environement](#environement)
    - [Ruby gems](#ruby-gems)
    - [Prepare local development](#prepare-local-development)
    - [File structure](#file-structure)
  - [Running the app](#running-the-app)
  - [Running the tests](#running-the-tests)
  - [Test cases](#test-cases)
    - [Example D](#example-d)
    - [Example E](#example-e)
    - [Example F](#example-f)
  - [Notes](#notes)

## Description

This application is a simulation of a toy robot moving on a square tabletop with a dimension of 5 units x 5 units. The original problem description, constraints and examples of inputs and outputs can be found [here](./PROBLEM.md).

User can use 1 of the following commands to controll the robot:

```text
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

## Setup

### Environement

This app runs on **Ruby 2.6.6** installed on your local machine. If you need help installing Ruby, take a look at the [official installation guide](https://www.ruby-lang.org/en/documentation/installation/).

### Ruby gems

```bash
# run this first to install the gems
bundle install
```

- [minitest](https://github.com/seattlerb/minitest): a built-in library since Ruby 2.3+
- [rake](https://rubygems.org/gems/rake): a Make-like program implemented in Ruby
- [rubocop](https://rubygems.org/gems/rubocop): a Ruby code style checker and formatter
  
Handle errors:
  - Run `gem update rubocop` if you already have the gem and `Error: unrecognized cop ... found in .rubocop.yml...` 
  


### Prepare local development

1. Clone this project: `git clone git@github.com:<REDACTED>/my-toy-robot.git`
2. Change to the directory: `cd my-toy-robot`

> REDACTED as requested.

### File structure

```text
<root>
  |
  |-app/
      |-factories/
      |-models/
  |-test/
      |-data/
      |-system/
      |-unit/
  |-app.rb
  |-Rakefile
  |-.rubocop.yml
  |-README.md
```

## Running the app

```bash
ruby app.rb
```

## Running the tests

```bash
# default task: run rubocop style check, unit tests and system tests
bundle exec rake

# similar to default rake, but *verbosely*
bundle exec rake test_verbose

# run unit tests
bundle exec rake unit_test

# run unit tests *verbosely*
bundle exec rake unit_test_verbose

# run system tests
bundle exec rake system_test

# run system tests *verbosely*
bundle exec rake system_test_verbose
```

## Test cases

There are 80 unit tests, and 6 system tests. The system tests include 3 examples provided by the [original problem description](./PROBLEM.md), and 3 custom examples.

Data for system tests are stored within `test/data/` folder, for example:

```text
test/
    |-data/
        |-test_data_example_a.txt
        |-test_data_example_b.txt
        |-test_data_example_c.txt
        |-...
```

Original system test cases:

- [Example a](./PROBLEM.md#example-a)
- [Example b](./PROBLEM.md#example-b)
- [Example c](./PROBLEM.md#example-c)

Custom additional tests:

### Example D

```text
PLACE 0,0,NORTH
MOVE
MOVE
MOVE
MOVE
MOVE
REPORT
```

Expected output:

```text
0,4,NORTH
```

### Example E

```text
PLACE 0,0,EAST
MOVE
MOVE
LEFT
MOVE
MOVE
MOVE
MOVE
REPORT
```

Expected output:

```text
2,4,NORTH
```

### Example F

```text
PLACE 2,2,SOUTH
MOVE
MOVE
MOVE
REPORT
RIGHT
MOVE
MOVE
MOVE
REPORT
```

Expected output:

```text
2,0,SOUTH
0,0,WEST
```

## Notes

- This app uses [Command Pattern](https://refactoring.guru/design-patterns/command) to implement the logic behind the interface. It converts user input into corresponding commands. This pattern helps testing on the robot's actions easier.
- Robot knows about Position, while Table does not know about Position. However, Table class can check if a coordinate [X, Y] is located within the Table's boundaries.
- CommandFactory class takes a string, parse it and convert it into corresponding command. The string can come from anywhere. The app currently use it to read commands from STDIN, but it can also be used to read commands from text file, for example, **in system test**.

&copy; 2020
