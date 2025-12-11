require "../spec_helper"

# About Tuples
#
# Tuples are fixed-size, immutable collections where each element
# can have a different type. They're useful for returning multiple
# values from methods and for small, typed data structures.

def min_max(arr : Array(Int32)) : {Int32, Int32}
  {arr.min, arr.max}
end

def get_person : {String, Int32}
  {"Alice", 30}
end

describe "About Tuples" do
  it "knows tuples are created with braces" do
    tuple = {1, "hello", true}
    tuple.class.to_s.should eq(__)
  end

  it "knows tuples have a fixed size" do
    tuple = {1, 2, 3}
    tuple.size.should eq(__)
  end

  it "knows tuple elements are accessed by index" do
    tuple = {"first", "second", "third"}
    tuple[0].should eq(__)
    tuple[1].should eq(__)
    tuple[2].should eq(__)
  end

  it "knows tuples can hold different types" do
    tuple = {42, "hello", 3.14}
    tuple[0].class.to_s.should eq(__)
    tuple[1].class.to_s.should eq(__)
    tuple[2].class.to_s.should eq(__)
  end

  it "knows tuples are immutable" do
    tuple = {1, 2, 3}
    # tuple[0] = 10  # Would not compile
    tuple[0].should eq(__)
  end

  it "knows tuples can be destructured" do
    tuple = {10, 20}
    a, b = tuple
    a.should eq(__)
    b.should eq(__)
  end

  it "knows tuples are useful for multiple return values" do
    min, max = min_max([3, 1, 4, 1, 5])
    min.should eq(__)
    max.should eq(__)
  end

  it "knows tuples preserve type information" do
    name, age = get_person
    typeof(name).should eq(__)
    typeof(age).should eq(__)
  end

  it "knows about NamedTuples with keys" do
    person = {name: "Alice", age: 30}
    person[:name].should eq(__)
    person[:age].should eq(__)
  end

  it "knows NamedTuple keys are symbols" do
    data = {count: 5, total: 100}
    data.keys.should eq(__)
  end

  it "knows NamedTuples can be destructured" do
    person = {name: "Bob", age: 25}
    name = person[:name]
    age = person[:age]
    name.should eq(__)
    age.should eq(__)
  end

  it "knows tuples can be iterated" do
    values = [] of Int32
    {1, 2, 3}.each { |v| values << v }
    values.should eq(__)
  end

  it "knows tuples can be converted to arrays" do
    tuple = {1, 2, 3}
    tuple.to_a.should eq(__)
  end

  it "knows NamedTuples can be merged" do
    t1 = {a: 1, b: 2}
    t2 = {b: 20, c: 30}
    merged = t1.merge(t2)
    merged[:a].should eq(__)
    merged[:b].should eq(__)
    merged[:c].should eq(__)
  end

  it "knows typeof shows the tuple type" do
    tuple = {1, "hello"}
    typeof(tuple).should eq(__)
  end

  it "knows tuples can be compared" do
    ({1, 2} == {1, 2}).should eq(__)
    ({1, 2} == {2, 1}).should eq(__)
  end

  it "knows empty tuples exist" do
    empty = Tuple.new
    empty.size.should eq(__)
  end
end
