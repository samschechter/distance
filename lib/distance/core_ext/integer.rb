# Test to see if Fixnum/Bignum are deprecated, which implies we are in ruby 2.4
# or greater

# Silence any deprecation warnings
warn_level = $VERBOSE
$VERBOSE = nil
v2_4 = Fixnum == Integer
$VERBOSE = warn_level

if v2_4
  class Integer
    alias_method :orig_multiply, :*

    def *(other)
      other.is_a?(Distance) ? other * self : orig_multiply(other)
    end
  end
else
  # In ruby versions before 2.4, multiplication was defined in Bignum and Fixnum,
  # not in Integer
  class Bignum
    alias_method :orig_multiply, :*

    def *(other)
      other.is_a?(Distance) ? other * self : orig_multiply(other)
    end
  end

  class Fixnum
    alias_method :orig_multiply, :*

    def *(other)
      other.is_a?(Distance) ? other * self : orig_multiply(other)
    end
  end
end
