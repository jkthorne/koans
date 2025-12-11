require "../spec_helper"

# About Type Inference (Crystal-specific)
#
# Crystal infers types at compile time, giving you the safety
# of static typing without the verbosity. The compiler figures
# out types from context, but you can add annotations when needed.

def add_numbers(a : Int32, b : Int32)
  a + b
end

def multiply(a : Int32, b : Int32) : Int32
  a * b
end

class Person3
  # Either annotate type or initialize in initialize
  @name : String
  @age = 0  # Type inferred from initial value

  def initialize(@name : String)
  end

  def name
    @name
  end

  def age
    @age
  end
end

describe "About Type Inference" do
  it "knows types are inferred from literals" do
    number = 42
    typeof(number).should eq(__)

    text = "hello"
    typeof(text).should eq(__)

    flag = true
    typeof(flag).should eq(__)
  end

  it "knows types are inferred from expressions" do
    result = 1 + 2
    typeof(result).should eq(__)

    concat = "hello" + " world"
    typeof(concat).should eq(__)
  end

  it "knows array types are inferred from elements" do
    numbers = [1, 2, 3]
    typeof(numbers).should eq(__)

    strings = ["a", "b", "c"]
    typeof(strings).should eq(__)
  end

  it "knows hash types are inferred from contents" do
    hash = {"a" => 1, "b" => 2}
    typeof(hash).should eq(__)
  end

  it "knows empty collections need explicit types" do
    # Cannot infer type of empty array without annotation
    empty_arr = [] of Int32
    typeof(empty_arr).should eq(__)

    empty_hash = {} of String => Int32
    typeof(empty_hash).should eq(__)
  end

  it "knows type annotations can be explicit" do
    value : Float64 = 42  # Int literal assigned to Float64 variable
    typeof(value).should eq(__)
  end

  it "knows method return types can be inferred" do
    result = add_numbers(1, 2)
    typeof(result).should eq(__)
  end

  it "knows explicit return types document intent" do
    result = multiply(3, 4)
    result.should eq(__)
  end

  it "knows conditional expressions create union types" do
    value = rand(2) == 0 ? "text" : 123
    # Type is String | Int32 because either branch is possible
    (value.is_a?(String) || value.is_a?(Int32)).should eq(__)
  end

  it "knows typeof returns the compile-time type" do
    value = [1, 2, 3]
    typeof(value).should eq(__)

    # typeof works with expressions too
    typeof(1 + 2).should eq(__)
  end

  it "knows class returns runtime type" do
    value : Int32 | String = "hello"
    value.class.should eq(__)

    value = 42
    value.class.should eq(__)
  end

  it "knows typeof vs class difference" do
    value : Int32 | String = "hello"

    # typeof gives compile-time type (the union)
    (typeof(value) == (Int32 | String)).should eq(__)

    # class gives runtime type (the actual value)
    value.class.should eq(__)
  end

  it "knows instance variables need type annotation or initialization" do
    person = Person3.new("Alice")
    typeof(person.name).should eq(__)
    typeof(person.age).should eq(__)
  end

  it "knows generic types are inferred" do
    # Array(Int32) is inferred
    arr = [1, 2, 3]
    arr << 4  # Only Int32 allowed
    arr.should eq(__)
  end
end
