class Numeric
  def meters
    Distance.meters(self)
  end

  alias_method :meter, :meters

  def kilometers
    Distance.kilometers(self)
  end

  alias_method :kilometer, :kilometers

  def inches
    Distance.inches(self)
  end

  alias_method :inch, :inches

  def feet
    Distance.feet(self)
  end

  alias_method :foot, :feet

  def miles
    Distance.miles(self)
  end

  alias_method :mile, :miles

  def millimeters
    Distance.millimeters(self)
  end

  alias_method :millimeter, :millimeters

  def centimeters
    Distance.centimeters(self)
  end

  alias_method :centimeter, :centimeters
end
