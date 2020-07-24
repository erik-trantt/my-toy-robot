# class Robot
class Robot
  attr_accessor :position

  def initialize(position = nil)
    @position = position
  end

  def placed?
    !@position.nil?
  end

  def report_position
    return 'Not in place' unless placed?

    @position.to_h.values.join(',')
  end
end
