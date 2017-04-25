class Numeric
  def kilometers
    Distance.kilometers(self)
  end

  alias_method :kilometer, :kilometers

  def miles
    Distance.miles(self)
  end

  alias_method :mile, :miles
end
