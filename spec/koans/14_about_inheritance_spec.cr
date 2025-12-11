require "../spec_helper"

# About Inheritance
#
# Inheritance allows classes to inherit behavior from parent classes.
# Crystal supports single inheritance - a class can only have one parent.
# Use < to indicate the parent class.

class Animal
  property name : String

  def initialize(@name : String)
  end

  def speak
    "..."
  end

  def description
    "#{@name} says #{speak}"
  end
end

class Cat < Animal
  def speak
    "Meow!"
  end

  def purr
    "Purrrr..."
  end
end

class Kitten < Cat
  def speak
    "Mew!"
  end
end

class Vehicle
  getter speed : Int32

  def initialize
    @speed = 0
  end

  def accelerate(amount : Int32)
    @speed += amount
  end

  def brake(amount : Int32)
    @speed = [@speed - amount, 0].max
  end
end

class Car < Vehicle
  getter wheels : Int32

  def initialize
    super
    @wheels = 4
  end

  def accelerate(amount : Int32)
    super(amount * 2)  # Cars accelerate faster
  end
end

class Shape
  def area : Float64
    0.0
  end
end

class Circle < Shape
  def initialize(@radius : Float64)
  end

  def area : Float64
    Math::PI * @radius ** 2
  end
end

class Square < Shape
  def initialize(@side : Float64)
  end

  def area : Float64
    @side ** 2
  end
end

describe "About Inheritance" do
  it "knows child classes inherit from parent classes" do
    cat = Cat.new("Whiskers")
    cat.should be_a(Cat)
    cat.class.to_s.should eq(__)  # Cat is also an Animal
  end

  it "knows child classes inherit methods" do
    cat = Cat.new("Whiskers")
    cat.name.should eq(__)
  end

  it "knows child classes can override methods" do
    animal = Animal.new("Generic")
    animal.speak.should eq(__)

    cat = Cat.new("Whiskers")
    cat.speak.should eq(__)
  end

  it "knows child classes can add new methods" do
    cat = Cat.new("Fluffy")
    cat.purr.should eq(__)
    # animal.purr would not compile - Animal doesn't have purr
  end

  it "knows inherited methods use overridden methods" do
    cat = Cat.new("Mittens")
    cat.description.should eq(__)
  end

  it "knows inheritance can be multi-level" do
    kitten = Kitten.new("Tiny")
    kitten.should be_a(Kitten)
    kitten.should be_a(Cat)
    kitten.class.to_s.should eq(__)
  end

  it "knows deeply inherited classes override all ancestors" do
    kitten = Kitten.new("Tiny")
    kitten.speak.should eq(__)
  end

  it "knows super calls the parent method" do
    car = Car.new
    car.speed.should eq(__)

    car.accelerate(10)
    car.speed.should eq(__)  # 10 * 2 because Car doubles acceleration
  end

  it "knows super in initialize calls parent initialize" do
    car = Car.new
    car.wheels.should eq(__)
    car.speed.should eq(__)  # Inherited from Vehicle
  end

  it "knows polymorphism allows treating children as parent type" do
    shapes = [] of Shape
    shapes << Circle.new(2.0)
    shapes << Square.new(3.0)

    # Both respond to area, despite being different types
    areas = shapes.map(&.area)
    areas[0].should be_close(__f__, 0.01)  # π * 2²
    areas[1].should be_close(__f__, 0.01)  # 3²
  end

  it "knows about is_a? for type checking" do
    cat = Cat.new("Tom")
    cat.is_a?(Cat).should eq(__)
    cat.is_a?(Animal).should eq(__)
    cat.is_a?(Kitten).should eq(__)
  end

  it "knows about class for getting the exact type" do
    animal = Animal.new("Generic")
    cat = Cat.new("Tom")

    animal.class.should eq(__)
    cat.class.should eq(__)
  end
end
