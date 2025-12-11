require "../spec_helper"

# About Generics
#
# Generics allow you to write code that works with any type.
# The type is specified when using the generic class or method.
# Crystal's Array, Hash, and many stdlib classes are generic.

class GenericBox(T)
  property value : T

  def initialize(@value : T)
  end

  def transform(&block : T -> T) : GenericBox(T)
    GenericBox(T).new(block.call(@value))
  end
end

class Pair(A, B)
  getter first : A
  getter second : B

  def initialize(@first : A, @second : B)
  end

  def swap : Pair(B, A)
    Pair(B, A).new(@second, @first)
  end
end

class Stack(T)
  @items : Array(T)

  def initialize
    @items = [] of T
  end

  def push(item : T)
    @items << item
  end

  def pop : T?
    @items.pop?
  end

  def peek : T?
    @items.last?
  end

  def size
    @items.size
  end

  def empty?
    @items.empty?
  end
end

def identity(value : T) : T forall T
  value
end

class NumberBox(T)
  getter value : T

  def initialize(@value : T)
  end

  def double
    @value * 2
  end
end

describe "About Generics" do
  it "knows Array is generic" do
    int_array = Array(Int32).new
    int_array << 1
    int_array << 2
    int_array.should eq(__)
  end

  it "knows Hash is generic with two type parameters" do
    hash = Hash(String, Int32).new
    hash["one"] = 1
    hash["two"] = 2
    hash["one"].should eq(__)
  end

  it "knows custom generic classes can be created" do
    box = GenericBox(String).new("hello")
    box.value.should eq(__)
  end

  it "knows type is inferred from constructor argument" do
    box = GenericBox.new(42)  # Type inferred as GenericBox(Int32)
    box.value.should eq(__)
  end

  it "knows generic methods preserve type" do
    box = GenericBox.new(10)
    transformed = box.transform { |v| v * 2 }
    transformed.value.should eq(__)
  end

  it "knows classes can have multiple type parameters" do
    pair = Pair.new("hello", 42)
    pair.first.should eq(__)
    pair.second.should eq(__)
  end

  it "knows generic operations can change types" do
    pair = Pair.new("hello", 42)
    swapped = pair.swap
    swapped.first.should eq(__)
    swapped.second.should eq(__)
  end

  it "knows generic stacks work with any type" do
    stack = Stack(String).new
    stack.push("first")
    stack.push("second")
    stack.size.should eq(__)
    stack.pop.should eq(__)
    stack.pop.should eq(__)
  end

  it "knows generic methods can be defined" do
    identity(42).should eq(__)
    identity("hello").should eq(__)
  end

  it "knows typeof shows the generic type" do
    box = GenericBox.new("test")
    typeof(box).should eq(__)
  end

  it "knows Set is generic" do
    set = Set(Int32).new
    set << 1
    set << 2
    set << 1  # Duplicates ignored
    set.size.should eq(__)
  end

  it "knows generic constraints can be applied" do
    # NumberBox class is defined at top level
    box = NumberBox.new(21)
    box.double.should eq(__)
  end
end
