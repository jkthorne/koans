require "../spec_helper"

# About Methods
#
# Methods in Crystal are defined with 'def' and can have
# type annotations for parameters and return values.
# Crystal infers types when possible, but explicit types
# improve documentation and catch errors earlier.

# Helper methods for koans
def simple_method
  "simple result"
end

def method_with_parameter(name : String)
  "Hello, #{name}!"
end

def method_with_default(name = "World")
  "Hello, #{name}!"
end

def method_with_multiple_params(a : Int32, b : Int32)
  a + b
end

def method_with_return_type : String
  "typed return"
end

def method_with_explicit_return(value : Int32) : String
  return "negative" if value < 0
  return "zero" if value == 0
  "positive"
end

def method_with_splat(*args : Int32)
  args.sum
end

def method_with_named_params(*, first : Int32, second : Int32)
  first - second
end

def method_with_double_splat(**options)
  options
end

def method_returns_last_expression
  x = 1
  y = 2
  x + y  # This is returned
end

def recursive_factorial(n : Int32) : Int32
  return 1 if n <= 1
  n * recursive_factorial(n - 1)
end

describe "About Methods" do
  it "knows methods can be called without parentheses" do
    result = simple_method
    result.should eq(__)
  end

  it "knows methods can take parameters" do
    result = method_with_parameter("Crystal")
    result.should eq(__)
  end

  it "knows methods can have default parameters" do
    result1 = method_with_default
    result1.should eq(__)

    result2 = method_with_default("Crystal")
    result2.should eq(__)
  end

  it "knows methods can have multiple parameters" do
    result = method_with_multiple_params(3, 4)
    result.should eq(__)
  end

  it "knows methods can have explicit return types" do
    result = method_with_return_type
    result.should eq(__)
  end

  it "knows return exits the method early" do
    method_with_explicit_return(-5).should eq(__)
    method_with_explicit_return(0).should eq(__)
    method_with_explicit_return(5).should eq(__)
  end

  it "knows the last expression is the return value" do
    result = method_returns_last_expression
    result.should eq(__)
  end

  it "knows methods can use splat for variable arguments" do
    method_with_splat(1, 2, 3).should eq(__)
    method_with_splat(1, 2, 3, 4, 5).should eq(__)
  end

  it "knows about named parameters after *" do
    result = method_with_named_params(first: 10, second: 3)
    result.should eq(__)
  end

  it "knows methods can be recursive" do
    recursive_factorial(5).should eq(__)  # 5 * 4 * 3 * 2 * 1
  end

  it "knows methods can call other methods" do
    # Methods in a class/module can call other methods
    # See the helper methods defined at the top of this file
    # simple_method returns "simple result"
    simple_method.should eq(__)
  end

  it "knows about methods that end with ?" do
    # Convention: methods ending in ? return Bool
    "hello".empty?.should eq(__)
    "".empty?.should eq(__)
  end

  it "knows about methods that end with !" do
    # Convention: methods ending in ! modify in place or raise
    array = [3, 1, 2]
    array.sort!
    array.should eq(__)
  end

  it "knows methods can yield to blocks" do
    # Blocks are covered more in the blocks koan
    result = [1, 2, 3].map { |x| x * 2 }
    result.should eq(__)
  end
end
