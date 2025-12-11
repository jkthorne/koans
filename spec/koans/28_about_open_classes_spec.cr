require "../spec_helper"

# About Open Classes
#
# Crystal allows reopening classes to add methods, similar to Ruby.
# This is powerful but should be used carefully to avoid confusion.
# It's often better to use modules or inheritance instead.

# Reopening String to add a custom method
class String
  def shout
    self.upcase + "!"
  end

  def whisper
    self.downcase + "..."
  end
end

# Reopening Int32 to add custom method
struct Int32
  def double
    self * 2
  end

  def positive_or_zero
    self < 0 ? 0 : self
  end
end

# Reopening Array to add custom method
class Array(T)
  def second?
    self[1]?
  end

  def third?
    self[2]?
  end
end

struct Float64
  def rounded_string(decimals = 2)
    "%.#{decimals}f" % self
  end
end

describe "About Open Classes" do
  it "knows classes can be reopened to add methods" do
    "hello".shout.should eq(__)
  end

  it "knows multiple methods can be added" do
    "HELLO".whisper.should eq(__)
  end

  it "knows structs can also be reopened" do
    5.double.should eq(__)
    (-3).positive_or_zero.should eq(__)
  end

  it "knows generic classes can be reopened" do
    arr = [1, 2, 3]
    arr.second?.should eq(__)
    arr.third?.should eq(__)
  end

  it "knows reopening works with empty arrays" do
    arr = [] of Int32
    arr.second?.should eq(__)
  end

  it "knows original methods still work" do
    "hello".upcase.should eq(__)
    5.abs.should eq(__)
    [1, 2, 3].first.should eq(__)
  end

  it "knows reopening can extend functionality" do
    # Float64 was reopened at top level with rounded_string method
    3.14159.rounded_string.should eq(__)
    3.14159.rounded_string(4).should eq(__)
  end
end
