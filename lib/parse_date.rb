class ParseDate
  def initialize(args)
    @day = args[0]
    @month = args[1]
    @year = args[2]
    @hours = args[3]
    @minutes = args[4]
  end

  def convert
    DateTime.new(@day, @month, @year, @hours, @minutes).in_time_zone
  end
end
