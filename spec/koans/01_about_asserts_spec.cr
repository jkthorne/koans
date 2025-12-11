require "../spec_helper"

# About Asserts
#
# Assertions are the building blocks of tests. In Crystal, we use
# the Spec library with `should` matchers. Understanding assertions
# is the first step on your path to enlightenment.

describe "About Asserts" do
  it "asserts truth" do
    # What is truth? In Crystal, true is a Bool literal.
    true.should eq(__)
  end

  it "asserts equality with eq" do
    # The eq matcher checks if two values are equal
    expected_value = 2
    actual_value = 1 + 1
    actual_value.should eq(__)
  end

  it "asserts equality is symmetric" do
    # Equality works both ways
    expected = "crystal"
    actual = "crystal"
    (expected == actual).should eq(__)
    (actual == expected).should eq(__)
  end

  it "understands that some values are not equal" do
    # Not all things are the same
    (1 == 2).should eq(__)
  end

  it "asserts inequality" do
    # The != operator checks if values are different
    result = (1 != 2)
    result.should eq(__)
  end

  it "can test for near equality on floats" do
    # Floating point numbers can have precision issues
    # be_close checks if two floats are within a delta
    result = 0.1 + 0.2
    result.should be_close(__f__, 0.001)  # What does 0.1 + 0.2 equal?
  end

  it "asserts with be for identity" do
    # 'be' checks object identity (same object in memory)
    a = "hello"
    b = a  # b references the same object as a
    (a.same?(b)).should eq(__)
  end

  it "knows that different strings are not identical" do
    # Two strings with the same content are equal but may not be identical
    a = "hello"
    b = "hello"
    (a == b).should eq(__)
    # Note: In Crystal, string literals may be interned, so same? might be true
  end

  it "expects nil with be_nil" do
    value = nil
    value.should be_nil
    value.nil?.should eq(__)
  end

  it "expects not nil" do
    value = "something"
    value.should_not be_nil
    value.nil?.should eq(__)
  end

  it "expects type with be_a" do
    # be_a checks if a value is of a certain type
    value = 42
    value.should be_a(Int32)
    # What type is a string? (already answered for you)
    "hello".should be_a(String)
    true.should eq(__)  # Confirm you understand
  end

  it "understands that be_a checks for type hierarchy" do
    # Int32 is also a Number (Int is abstract)
    value = 42
    value.should be_a(Int32)
    value.is_a?(Number).should eq(__)
    # Is 42 a String?
    value.is_a?(String).should eq(__)
  end
end
