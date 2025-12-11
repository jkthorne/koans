require "../spec_helper"

# About Blocks
#
# Blocks are chunks of code that can be passed to methods.
# In Crystal, blocks are enclosed in { } or do...end and
# can receive parameters between |pipes|.

describe "About Blocks" do
  it "knows blocks can be passed to methods" do
    result = [1, 2, 3].map { |x| x * 2 }
    result.should eq(__)
  end

  it "knows blocks use |variables| for parameters" do
    result = [] of Int32
    [1, 2, 3].each { |num| result << num * 10 }
    result.should eq(__)
  end

  it "knows blocks can have multiple parameters" do
    result = [] of String
    {"a" => 1, "b" => 2}.each { |key, value| result << "#{key}:#{value}" }
    result.should eq(__)
  end

  it "knows about do...end syntax for multiline blocks" do
    result = [1, 2, 3].map do |x|
      doubled = x * 2
      doubled + 1
    end
    result.should eq(__)
  end

  it "knows blocks return the last expression" do
    result = [1, 2, 3].map do |x|
      x * 2
      x * 3  # This is returned
    end
    result.should eq(__)
  end

  it "knows about select with blocks" do
    result = [1, 2, 3, 4, 5].select { |x| x > 3 }
    result.should eq(__)
  end

  it "knows about reject with blocks" do
    result = [1, 2, 3, 4, 5].reject { |x| x > 3 }
    result.should eq(__)
  end

  it "knows about reduce/fold with blocks" do
    sum = [1, 2, 3, 4].reduce(0) { |acc, x| acc + x }
    sum.should eq(__)
  end

  it "knows about find with blocks" do
    result = [1, 2, 3, 4, 5].find { |x| x > 3 }
    result.should eq(__)
  end

  it "knows about any? with blocks" do
    [1, 2, 3].any? { |x| x > 2 }.should eq(__)
    [1, 2, 3].any? { |x| x > 5 }.should eq(__)
  end

  it "knows about all? with blocks" do
    [1, 2, 3].all? { |x| x > 0 }.should eq(__)
    [1, 2, 3].all? { |x| x > 1 }.should eq(__)
  end

  it "knows about count with blocks" do
    result = [1, 2, 3, 4, 5].count { |x| x.even? }
    result.should eq(__)
  end

  it "knows about times with blocks" do
    result = 0
    3.times { |i| result += i }
    result.should eq(__)
  end

  it "knows about upto with blocks" do
    result = [] of Int32
    1.upto(3) { |i| result << i }
    result.should eq(__)
  end

  it "knows blocks capture outer variables" do
    outer = 10
    result = [1, 2, 3].map { |x| x + outer }
    result.should eq(__)
  end

  it "knows about tap for side effects" do
    result = [1, 2, 3].tap { |arr| arr << 4 }
    result.should eq(__)
  end

  it "knows about shorthand block syntax with &" do
    # &.method is shorthand for { |x| x.method }
    result = ["hello", "world"].map(&.upcase)
    result.should eq(__)
  end

  it "knows about chaining methods with blocks" do
    result = [1, 2, 3, 4, 5]
      .select { |x| x.odd? }
      .map { |x| x * 2 }
    result.should eq(__)
  end

  it "knows about partition with blocks" do
    evens, odds = [1, 2, 3, 4, 5].partition { |x| x.even? }
    evens.should eq(__)
    odds.should eq(__)
  end

  it "knows about group_by with blocks" do
    result = [1, 2, 3, 4, 5].group_by { |x| x.even? }
    result[true].should eq(__)
    result[false].should eq(__)
  end
end
