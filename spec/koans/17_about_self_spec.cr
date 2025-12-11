require "../spec_helper"

# About Self
#
# 'self' refers to the current object context.
# Inside an instance method, self is the instance.
# Inside a class method (def self.method), self is the class.
# Understanding self is key to understanding Crystal's object model.

class SelfExample
  property value : Int32

  def initialize(@value : Int32)
  end

  def get_self
    self
  end

  def value_via_self
    self.value
  end

  def compare_with(other : SelfExample)
    self.value <=> other.value
  end

  def self.class_self
    self
  end

  def self.create_default
    self.new(0)
  end

  def increment_and_return
    @value += 1
    self  # Return self for method chaining
  end
end

class Builder
  property result : String

  def initialize
    @result = ""
  end

  def add(text : String)
    @result += text
    self
  end

  def add_space
    @result += " "
    self
  end
end

class Counter2
  @@total = 0

  def initialize
    @@total += 1
  end

  def self.total
    @@total
  end

  def self.reset
    @@total = 0
    self  # Return class for chaining
  end

  def self.describe
    "Total: #{@@total}"
  end
end

describe "About Self" do
  it "knows self in instance method is the instance" do
    obj = SelfExample.new(42)
    obj.get_self.should eq(__)
  end

  it "knows self can access instance methods" do
    obj = SelfExample.new(42)
    obj.value_via_self.should eq(__)
  end

  it "knows self in class method is the class" do
    SelfExample.class_self.should eq(__)
  end

  it "knows self in class methods allows calling new" do
    obj = SelfExample.create_default
    obj.value.should eq(__)
  end

  it "knows returning self enables method chaining" do
    obj = SelfExample.new(0)
    obj.increment_and_return.increment_and_return.increment_and_return
    obj.value.should eq(__)
  end

  it "knows builder pattern uses self for fluent interfaces" do
    result = Builder.new
      .add("Hello")
      .add_space
      .add("World")
      .result
    result.should eq(__)
  end

  it "knows self can be used for comparison" do
    a = SelfExample.new(10)
    b = SelfExample.new(20)
    a.compare_with(b).should eq(__)  # <=> returns -1, 0, or 1
  end

  it "knows class methods can chain with self" do
    Counter2.reset
    Counter2.new
    Counter2.new
    Counter2.total.should eq(__)
  end

  it "knows self.class gets the class of an instance" do
    obj = SelfExample.new(1)
    obj.class.should eq(__)
  end

  it "knows self changes context in class body" do
    class SelfInBody
      # At class body level, self is the class
      def self.who_am_i
        self.name
      end
    end

    SelfInBody.who_am_i.should eq(__)
  end
end
