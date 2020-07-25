# Toy Robot Simulator

## Table of contents

* [Original problem description](./PROBLEM.md)
* [Setup](#setup)
* [Running the app](#running-the-app)
* [Running the tests](#running-the-tests)
* [Test cases](#test-cases)
* [Notes](#notes)

## Setup

1. This app runs on Ruby 2.6.6 installed on your local machine. If you need help installing Ruby, take a look at the [official installation guide](https://www.ruby-lang.org/en/documentation/installation/)
2. This app uses [Minitest](https://github.com/seattlerb/minitest), a built-in library since Ruby 2.3+
3. Clone this project: `git clone git@github.com:erik-trantt/toy_robot.git`
4. Change to the directory: `cd my-toy-robot`

## Running the app

```bash
ruby app.rb
```

## Running the tests

```bash
# default task: run rubocop style check, unit tests and system tests
rake

# similar to default rake, but *verbosely*
rake test_verbose

# run unit tests
rake unit_test

# run unit tests *verbosely*
rake unit_test_verbose

# run system tests
rake system_test

# run system tests *verbosely*
rake system_test_verbose
```

## Test cases

There are 3 examples provided by the [problem description](./PROBLEM.md):

* [Example a](./PROBLEM.md#example-a)
* [Example b](./PROBLEM.md#example-b)
* [Example c](./PROBLEM.md#example-c)

And, there are 3 additional tests:

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

* This app uses [Command Pattern](https://refactoring.guru/design-patterns/command).
* Robot knows abt Position, while Table does not know about Position. However, Table class can check if a coordinate [X, Y] is located within the Table's boundaries.
* CommandFactory class takes a string, parse it and convert it into corresponding command. The string can come from anywhere. The app currently use it to read commands from STDIN, but it can also be used to read commands from text file, for example, **in system test**.
