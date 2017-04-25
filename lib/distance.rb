require 'distance/version'

class Distance
  # Multipliers from standard race units to meters
  module Multiplier
    KILOMETER = 1000.0
    MILE      = 1609.344
  end
  private_constant :Multiplier

  def initialize(distance_in_meters)
    @distance_in_meters = distance_in_meters.to_f
  end

  MARATHON      = new(42195.0)
  HALF_MARATHON = new(21097.5)

  def self.kilometers(n)
    new(n * Multiplier::KILOMETER)
  end

  def self.miles(n)
    new(n * Multiplier::MILE)
  end

  def in_kilometers?
    distance_in_meters % Multiplier::KILOMETER == 0
  end

  def to_f
    distance_in_meters
  end

  def to_miles
    (distance_in_meters / Multiplier::MILE).round(2)
  end

  def to_kilometers
    distance_in_meters / Multiplier::KILOMETER
  end

  def ==(other)
    return false unless other.is_a?(Distance)
    (to_f - other.to_f).abs < 0.01
  end

  private

  attr_reader :distance_in_meters
end
