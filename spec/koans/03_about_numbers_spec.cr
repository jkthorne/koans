require "../spec_helper"

# About Numbers
#
# Crystal has several numeric types, all with explicit sizes.
# This is different from Ruby where numbers are automatically sized.
# Understanding Crystal's number types is key to writing efficient code.

describe "About Numbers" do
  it "knows that integers have a type" do
    # Integer literals default to Int32
    typeof(42).should eq(__)
  end

  it "knows that large integers can be Int64" do
    # Adding _i64 suffix creates an Int64
    big_number = 42_i64
    typeof(big_number).should eq(__)
  end

  it "knows that floats default to Float64" do
    typeof(3.14).should eq(__)
  end

  it "knows basic arithmetic" do
    (2 + 3).should eq(__)
    (5 - 2).should eq(__)
    (3 * 4).should eq(__)
  end

  it "knows integer division truncates" do
    # Integer division drops the remainder
    (7 / 2).should eq(__)
  end

  it "knows float division preserves decimals" do
    # At least one operand must be a float
    (7.0 / 2).should eq(__)
  end

  it "knows the modulo operator gives remainder" do
    (7 % 3).should eq(__)
    (8 % 2).should eq(__)
  end

  it "knows about exponentiation" do
    # ** is the power operator
    (2 ** 3).should eq(__)
    (3 ** 2).should eq(__)
  end

  it "knows numbers can be compared" do
    (5 > 3).should eq(__)
    (5 < 3).should eq(__)
    (5 >= 5).should eq(__)
    (5 <= 4).should eq(__)
  end

  it "knows about negative numbers" do
    value = -42
    value.should eq(__)
    value.abs.should eq(__)
  end

  it "can convert between types" do
    # to_i converts to Int32, to_f converts to Float64
    int_val = 42.9.to_i
    int_val.should eq(__)

    float_val = 42.to_f
    float_val.should eq(__)
  end

  it "knows numbers can be formatted with underscores" do
    # Underscores make large numbers readable
    million = 1_000_000
    million.should eq(__)
  end

  it "knows about number methods" do
    # Numbers have useful methods
    5.even?.should eq(__)
    5.odd?.should eq(__)
    0.zero?.should eq(__)
    5.positive?.should eq(__)
    (-5).negative?.should eq(__)
  end

  it "knows about ranges of numbers" do
    # Ranges can be created with .. or ...
    inclusive_range = 1..5    # includes 5
    exclusive_range = 1...5  # excludes 5

    inclusive_range.includes?(5).should eq(__)
    exclusive_range.includes?(5).should eq(__)
  end

  it "can clamp numbers to a range" do
    # clamp restricts a number to within bounds
    10.clamp(1..5).should eq(__)
    3.clamp(1..5).should eq(__)
    0.clamp(1..5).should eq(__)
  end

  it "knows about integer overflow behavior" do
    # Crystal detects overflow by default
    max_int8 = Int8::MAX  # 127
    max_int8.should eq(__)
  end

  it "knows about times iterator" do
    # times creates an iterator from 0 to n-1
    sum = 0
    3.times { |i| sum += i }
    sum.should eq(__)  # 0 + 1 + 2
  end

  it "knows about upto and downto" do
    # upto and downto create ranges
    result = [] of Int32
    1.upto(3) { |i| result << i }
    result.should eq(__)

    result2 = [] of Int32
    3.downto(1) { |i| result2 << i }
    result2.should eq(__)
  end
end
