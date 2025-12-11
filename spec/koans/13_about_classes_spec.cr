require "../spec_helper"

# About Classes
#
# Classes in Crystal are blueprints for creating objects.
# They encapsulate data (instance variables) and behavior (methods).
# Instance variables start with @ and are typed.

class Dog
  property name : String
  property age : Int32

  def initialize(@name : String, @age : Int32 = 1)
  end

  def bark
    "Woof!"
  end

  def description
    "#{@name} is #{@age} years old"
  end
end

class Counter
  getter count : Int32

  def initialize
    @count = 0
  end

  def increment
    @count += 1
  end

  def decrement
    @count -= 1
  end
end

class Person
  getter first_name : String
  getter last_name : String
  setter nickname : String?
  property age : Int32

  def initialize(@first_name : String, @last_name : String, @age : Int32)
    @nickname = nil
  end

  def full_name
    @first_name + " " + @last_name
  end

  def nickname
    @nickname || @first_name
  end
end

class Rectangle
  def initialize(@width : Int32, @height : Int32)
  end

  def area
    @width * @height
  end

  def perimeter
    2 * (@width + @height)
  end

  def square?
    @width == @height
  end
end

class Greeter
  def self.greet(name : String)
    "Hello, #{name}!"
  end
end

class InstanceCounter
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.count
    @@count
  end

  def self.reset
    @@count = 0
  end
end

describe "About Classes" do
  it "knows classes create objects with new" do
    dog = Dog.new("Fido", 3)
    dog.class.to_s.should eq(__)
  end

  it "knows objects have instance variables" do
    dog = Dog.new("Fido", 3)
    dog.name.should eq(__)
    dog.age.should eq(__)
  end

  it "knows objects have methods" do
    dog = Dog.new("Rex", 2)
    dog.bark.should eq(__)
  end

  it "knows methods can use instance variables" do
    dog = Dog.new("Buddy", 5)
    dog.description.should eq(__)
  end

  it "knows about default parameter values in initialize" do
    dog = Dog.new("Puppy")
    dog.age.should eq(__)
  end

  it "knows property creates getter and setter" do
    dog = Dog.new("Max", 2)
    dog.name = "Maximus"
    dog.name.should eq(__)
  end

  it "knows getter creates only a reader" do
    counter = Counter.new
    counter.count.should eq(__)
    # counter.count = 5  # This would not compile
  end

  it "knows objects can have state that changes" do
    counter = Counter.new
    counter.increment
    counter.increment
    counter.count.should eq(__)

    counter.decrement
    counter.count.should eq(__)
  end

  it "knows about getter and setter separately" do
    person = Person.new("John", "Doe", 30)
    person.first_name.should eq(__)
    person.full_name.should eq(__)
  end

  it "knows about custom getters" do
    person = Person.new("Jane", "Doe", 25)
    person.nickname.should eq(__)  # Returns first_name as default

    person.nickname = "JD"
    person.nickname.should eq(__)
  end

  it "knows classes can compute derived values" do
    rect = Rectangle.new(4, 5)
    rect.area.should eq(__)
    rect.perimeter.should eq(__)
  end

  it "knows methods can return booleans" do
    rect1 = Rectangle.new(4, 4)
    rect1.square?.should eq(__)

    rect2 = Rectangle.new(4, 5)
    rect2.square?.should eq(__)
  end

  it "knows each object is independent" do
    dog1 = Dog.new("Rex", 3)
    dog2 = Dog.new("Max", 5)

    dog1.name.should eq(__)
    dog2.name.should eq(__)
    (dog1.name == dog2.name).should eq(__)
  end

  it "knows about class methods with self" do
    Greeter.greet("World").should eq(__)
  end

  it "knows about class variables with @@" do
    InstanceCounter.reset
    InstanceCounter.count.should eq(__)
    InstanceCounter.new
    InstanceCounter.new
    InstanceCounter.count.should eq(__)
  end
end
