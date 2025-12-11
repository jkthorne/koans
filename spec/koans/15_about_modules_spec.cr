require "../spec_helper"

# About Modules
#
# Modules in Crystal serve two purposes:
# 1. Namespaces - organizing code and preventing name collisions
# 2. Mixins - sharing behavior across classes via include/extend

module Greetings
  def hello
    "Hello!"
  end

  def goodbye
    "Goodbye!"
  end
end

module Formattable
  def formatted_name
    name.upcase
  end
end

module Walkable
  def walk
    "Walking..."
  end

  def steps_per_minute
    100
  end
end

module Runnable
  def run
    "Running!"
  end

  def steps_per_minute
    200
  end
end

class Greeter
  include Greetings
end

class Person2
  include Walkable

  property name : String

  def initialize(@name : String)
  end
end

class Athlete
  include Walkable
  include Runnable  # Later include takes precedence

  property name : String

  def initialize(@name : String)
  end
end

module Outer
  VERSION = "1.0"

  module Inner
    def self.greeting
      "Hello from Inner!"
    end
  end

  class MyClass
    def version
      VERSION
    end
  end
end

module ClassMethods
  def class_greeting
    "Hello from class!"
  end
end

class ExtendExample
  extend ClassMethods
end

module Countable
  @count = 0

  def increment
    @count += 1
  end

  def count
    @count
  end
end

class ItemCounter
  include Countable
end

module MathHelpers
  def self.double(x : Int32)
    x * 2
  end
end

module Config
  MAX_SIZE = 100
  DEFAULT_NAME = "Unknown"
end

describe "About Modules" do
  it "knows modules can be included in classes" do
    greeter = Greeter.new
    greeter.hello.should eq(__)
    greeter.goodbye.should eq(__)
  end

  it "knows included modules add instance methods" do
    person = Person2.new("Alice")
    person.walk.should eq(__)
    person.steps_per_minute.should eq(__)
  end

  it "knows later includes take precedence" do
    athlete = Athlete.new("Bob")
    # Runnable was included after Walkable
    athlete.steps_per_minute.should eq(__)
  end

  it "knows both module methods are available" do
    athlete = Athlete.new("Bob")
    athlete.walk.should eq(__)
    athlete.run.should eq(__)
  end

  it "knows modules can be nested for namespacing" do
    Outer::Inner.greeting.should eq(__)
  end

  it "knows nested classes access outer constants" do
    obj = Outer::MyClass.new
    obj.version.should eq(__)
  end

  it "knows extend adds class methods" do
    ExtendExample.class_greeting.should eq(__)
    # ExtendExample.new.class_greeting would not compile
  end

  it "knows modules can include instance variables" do
    counter = ItemCounter.new
    counter.count.should eq(__)
    counter.increment
    counter.increment
    counter.count.should eq(__)
  end

  it "knows modules can define self methods" do
    MathHelpers.double(5).should eq(__)
  end

  it "knows modules can have constants" do
    Config::MAX_SIZE.should eq(__)
    Config::DEFAULT_NAME.should eq(__)
  end

  it "knows about checking if a module is included" do
    person = Person2.new("Test")
    person.is_a?(Walkable).should eq(__)
    person.is_a?(Runnable).should eq(__)
  end
end
