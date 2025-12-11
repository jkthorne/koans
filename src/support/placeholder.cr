# Placeholder values for Crystal Koans
#
# Crystal is statically typed, so we need different placeholder types
# for different kinds of assertions. Replace these with the correct values!

# String placeholder - use for most equality comparisons
# Using __ (double underscore) as the generic placeholder
def __
  "FILL ME IN"
end

# Numeric placeholder - returns an unlikely value
def __n__
  999_999_999
end

# Float placeholder
def __f__
  999_999_999.999
end

# Boolean placeholder - always returns false
def __bool__
  false
end

# Char placeholder
def __char__
  '\u0000'
end

# Array placeholder
def __array__
  [] of String
end

# Hash placeholder
def __hash__
  {} of String => String
end

# Exception class placeholder
class FillMeInError < Exception
end

# For expect_raises exercises
def __exception__
  FillMeInError
end

# Nil placeholder (for exercises where nil is NOT the answer)
def __nil__
  nil
end
