# Test to see if Fixnum/Bignum are deprecated, which implies we are in ruby 2.4
# or greater

# Silence any deprecation warnings
warn_level = $VERBOSE
$VERBOSE = nil
$VERBOSE = warn_level

class Integer
  alias_method :orig_multiply, :*

  def *(other)
    other.is_a?(Distance) ? other * self : orig_multiply(other)
  end
end
