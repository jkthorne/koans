require "../spec_helper"

# About Structs
#
# Structs are value types in Crystal, while classes are reference types.
# Structs are allocated on the stack (when possible) and copied by value.
# Use structs for small, immutable data types for better performance.

struct Point2D
  property x : Int32
  property y : Int32

  def initialize(@x : Int32, @y : Int32)
  end

  def distance_from_origin
    Math.sqrt((@x ** 2 + @y ** 2).to_f)
  end

  def +(other : Point2D) : Point2D
    Point2D.new(@x + other.x, @y + other.y)
  end
end

struct Temperature
  getter celsius : Float64

  def initialize(@celsius : Float64)
  end

  def fahrenheit
    @celsius * 9 / 5 + 32
  end

  def kelvin
    @celsius + 273.15
  end
end

class PointClass
  property x : Int32
  property y : Int32

  def initialize(@x : Int32, @y : Int32)
  end
end

struct ImmutableData
  getter value : String

  def initialize(@value : String)
  end
end

record Person4, name : String, age : Int32
record RGB, r : UInt8, g : UInt8, b : UInt8

describe "About Structs" do
  it "knows structs are defined with 'struct'" do
    point = Point2D.new(3, 4)
    point.class.to_s.should eq(__)
  end

  it "knows struct properties work like class properties" do
    point = Point2D.new(3, 4)
    point.x.should eq(__)
    point.y.should eq(__)
  end

  it "knows structs can have methods" do
    point = Point2D.new(3, 4)
    point.distance_from_origin.should be_close(__f__, 0.01)
  end

  it "knows structs can define operators" do
    p1 = Point2D.new(1, 2)
    p2 = Point2D.new(3, 4)
    result = p1 + p2
    result.x.should eq(__)
    result.y.should eq(__)
  end

  it "knows structs are value types (copied by value)" do
    original = Point2D.new(1, 2)
    copy = original  # Creates a copy!

    copy.x = 10  # Modifying copy

    original.x.should eq(__)  # Original unchanged
    copy.x.should eq(__)
  end

  it "knows classes are reference types" do
    original = PointClass.new(1, 2)
    reference = original  # Same object!

    reference.x = 10  # Modifying through reference

    original.x.should eq(__)  # Original IS changed
    reference.x.should eq(__)
  end

  it "knows structs can be used for conversions" do
    temp = Temperature.new(100.0)
    temp.celsius.should eq(__)
    temp.fahrenheit.should eq(__)
    temp.kelvin.should be_close(__f__, 0.01)
  end

  it "knows structs are good for immutable data" do
    data = ImmutableData.new("constant")
    data.value.should eq(__)
    # data.value = "new"  # Would not compile - no setter
  end

  it "knows record macro creates simple structs" do
    # Person4 was defined at top level with record macro
    person = Person4.new("Alice", 30)
    person.name.should eq(__)
    person.age.should eq(__)
  end

  it "knows record structs are immutable by default" do
    # RGB was defined at top level with record macro
    color = RGB.new(255, 128, 0)
    # color.r = 0  # Would not compile - immutable
    color.r.should eq(__)
  end

  it "knows structs inherit from Struct" do
    point = Point2D.new(0, 0)
    point.is_a?(Struct).should eq(__)
    point.is_a?(Reference).should eq(__)
  end

  it "knows classes inherit from Reference" do
    point = PointClass.new(0, 0)
    point.is_a?(Reference).should eq(__)
    point.is_a?(Struct).should eq(__)
  end
end
