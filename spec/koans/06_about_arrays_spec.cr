require "../spec_helper"

# About Arrays
#
# Arrays in Crystal are ordered, typed collections of elements.
# Unlike Ruby, Crystal arrays must have a consistent type for all elements.
# This type safety helps catch errors at compile time.

describe "About Arrays" do
  it "knows arrays are created with brackets" do
    array = [1, 2, 3]
    array.class.to_s.should eq(__)
  end

  it "knows arrays have a size" do
    [1, 2, 3].size.should eq(__)
  end

  it "knows arrays can be accessed by index" do
    array = ["a", "b", "c"]
    array[0].should eq(__)
    array[1].should eq(__)
    array[2].should eq(__)
  end

  it "knows negative indices count from the end" do
    array = [1, 2, 3, 4, 5]
    array[-1].should eq(__)
    array[-2].should eq(__)
  end

  it "knows about first and last" do
    array = [1, 2, 3, 4, 5]
    array.first.should eq(__)
    array.last.should eq(__)
  end

  it "knows arrays can be sliced with ranges" do
    array = [1, 2, 3, 4, 5]
    array[1..3].should eq(__)   # inclusive
    array[1...3].should eq(__)  # exclusive
  end

  it "knows about appending to arrays" do
    array = [1, 2, 3]
    array << 4
    array.should eq(__)
  end

  it "knows about push and pop" do
    array = [1, 2, 3]
    array.push(4)
    array.should eq(__)

    popped = array.pop
    popped.should eq(__)
    array.should eq(__)
  end

  it "knows about shift and unshift" do
    array = [1, 2, 3]
    array.unshift(0)  # add to front
    array.should eq(__)

    shifted = array.shift  # remove from front
    shifted.should eq(__)
    array.should eq(__)
  end

  it "knows about concatenation" do
    ([1, 2] + [3, 4]).should eq(__)
  end

  it "knows about includes?" do
    array = [1, 2, 3]
    array.includes?(2).should eq(__)
    array.includes?(5).should eq(__)
  end

  it "knows about finding elements" do
    array = [1, 2, 3, 4, 5]
    result = array.find { |x| x > 3 }
    result.should eq(__)
  end

  it "knows about selecting elements" do
    array = [1, 2, 3, 4, 5]
    result = array.select { |x| x.even? }
    result.should eq(__)
  end

  it "knows about rejecting elements" do
    array = [1, 2, 3, 4, 5]
    result = array.reject { |x| x.even? }
    result.should eq(__)
  end

  it "knows about mapping elements" do
    array = [1, 2, 3]
    result = array.map { |x| x * 2 }
    result.should eq(__)
  end

  it "knows about reducing/folding" do
    array = [1, 2, 3, 4]
    sum = array.reduce(0) { |acc, x| acc + x }
    sum.should eq(__)

    product = array.reduce(1) { |acc, x| acc * x }
    product.should eq(__)
  end

  it "knows about sorting" do
    [3, 1, 4, 1, 5].sort.should eq(__)
    [3, 1, 4, 1, 5].sort { |a, b| b <=> a }.should eq(__)  # descending
  end

  it "knows about reversing" do
    [1, 2, 3].reverse.should eq(__)
  end

  it "knows about unique elements" do
    [1, 2, 2, 3, 3, 3].uniq.should eq(__)
  end

  it "knows about flattening nested arrays" do
    [[1, 2], [3, 4]].flatten.should eq(__)
  end

  it "knows about compact to remove nils" do
    array = [1, nil, 2, nil, 3]
    array.compact.should eq(__)
  end

  it "knows about joining into strings" do
    [1, 2, 3].join(", ").should eq(__)
  end

  it "knows about checking if any/all match" do
    array = [1, 2, 3, 4, 5]
    array.any? { |x| x > 4 }.should eq(__)
    array.all? { |x| x > 0 }.should eq(__)
    array.none? { |x| x > 5 }.should eq(__)
  end

  it "knows about empty arrays" do
    ([] of Int32).empty?.should eq(__)
    [1].empty?.should eq(__)
  end

  it "knows about min and max" do
    [3, 1, 4, 1, 5].min.should eq(__)
    [3, 1, 4, 1, 5].max.should eq(__)
  end

  it "knows about sum" do
    [1, 2, 3, 4, 5].sum.should eq(__)
  end

  it "knows that arrays are typed" do
    # The type is inferred from elements
    int_array = [1, 2, 3]
    typeof(int_array).should eq(__)

    string_array = ["a", "b", "c"]
    typeof(string_array).should eq(__)
  end

  it "knows about creating typed empty arrays" do
    # Empty arrays need explicit type
    empty = [] of String
    empty << "hello"
    empty.should eq(__)
  end
end
