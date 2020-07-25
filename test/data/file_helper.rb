class FileHelper
  def self.readlines_to_array(file)
    return unless File.exist?(file)
    File.open(file).readlines.map(&:chomp) 
  end
end
