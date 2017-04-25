class Integer
  alias_method :orig_multiply, :*

  def *(other)
    other.is_a?(Distance) ? other * self : orig_multiply(other)
  end
end
