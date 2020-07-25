class OutputHelper
  
  ### def capture_output(parser, inputs)
  # This captures any output to Ruby's standard output and return it as a string.
  # INPUTS:
  #   parser => CommandFactory
  #   inputs => an array of inputs by user: PLACE, MOVE, LEFT, RIGHT, REPORT
  # 
  # OUTPUT: 
  #   robot's position REPORT as string
  #   ReportCommand.execute uses `puts`, so there is a newline `\n` at end of string
  #   if there are multiple REPORT calls, return as a concatenated string
  #   
  # Source: https://www.rubyguides.com/2017/05/stringio-objects/

  def self.capture_output(parser, inputs)
    # initiate a new StringIO object
    # let it be the standard output $stdout
    io = StringIO.new
    $stdout = io
  
    # Simulate user entering inputs
    # Capture REPORT output to $stdout
    inputs.each do |input|
      command = parser.parse(input)
      command&.execute
    end
  
    # Restore original value
    $stdout = STDOUT
  
    # Reset pointer
    io.rewind
    # Read to the end, and return back
    io.read
  end
end
