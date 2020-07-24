# Toy Robot Simulator

## Table of contents

* [Problem description](./PROBLEM.md)
* [Setup](#setup)
* [Running the app](#running-the-app)
* [Running the tests](#running-the-tests)
* [Assumptions](#assumptions)

## Setup

1. This app needs Ruby 2.6.6 installed on your local machine. If you need help installing Ruby, take a look at the [official installation guide](https://www.ruby-lang.org/en/documentation/installation/).
2. This app uses [Minitest](https://github.com/seattlerb/minitest), a built-in library since Ruby 2.3+. No need to install anything else.
3. Clone this project: `git clone git@github.com:erik-trantt/toy_robot.git`
4. Change to the directory: `cd my-toy-robot`

## Running the app

```bash
ruby app.rb
```

## Running the tests

```bash
# tests run quietly
rake test

# tests run verbosely
rake test_verbose
```

## Development assumptions

- This app uses [Command Pattern](https://refactoring.guru/design-patterns/command).
- Robot knows abt Position, while Table does not know about Position. However, Table class can check if a coordinate [X, Y] is located within the Table's boundaries. 
- CommandFactory class takes a string, parse it and convert it into corresponding command. The string can come from anywhere. The app currently use it to read commands from STDIN, but it can also be used to read commands from text file.
