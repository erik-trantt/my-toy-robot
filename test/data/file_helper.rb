### class FileHelper
### self.readlines_to_array(file)
# 
# This class method read input files and turn contents into an array of user inputs.
# INPUT:
#   path to data file
# OUTPUT:
#   nil if file is not found
#   an array of inputs (as string) if file is found

class FileHelper
  def self.readlines_to_array(file)
    return unless File.exist?(file)
    File.open(file).readlines.map(&:chomp) 
  end
end
