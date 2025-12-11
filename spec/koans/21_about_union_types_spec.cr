require "../spec_helper"

# About Union Types (Crystal-specific)
#
# Union types are one of Crystal's most powerful features.
# A union type means a variable can hold one of several types.
# The compiler ensures you handle all possible types safely.

describe "About Union Types" do
  it "knows variables can have union types" do
    value : Int32 | String = "hello"
    value.class.to_s.should eq(__)

    value = 42
    value.class.to_s.should eq(__)
  end

  it "knows is_a? checks the current type" do
    value : Int32 | String = "hello"
    value.is_a?(String).should eq(__)
    value.is_a?(Int32).should eq(__)
  end

  it "knows case can match union types" do
    def describe_value(value : Int32 | String | Bool) : String
      case value
      when Int32  then "number"
      when String then "text"
      when Bool   then "boolean"
      else             "unknown"
      end
    end

    describe_value(42).should eq(__)
    describe_value("hi").should eq(__)
    describe_value(true).should eq(__)
  end

  it "knows if with is_a? narrows the type" do
    value : Int32 | String = "hello"

    result = if value.is_a?(String)
               value.upcase  # Compiler knows value is String here
             else
               value.to_s
             end
    result.should eq(__)
  end

  it "knows Nil is commonly in unions" do
    # String? is shorthand for String | Nil
    value : String? = nil
    value.should eq(__)

    value = "present"
    value.should eq(__)
  end

  it "knows about responds_to? for duck typing" do
    value : Int32 | String = "hello"

    result = if value.responds_to?(:upcase)
               value.upcase
             else
               value.to_s
             end
    result.should eq(__)
  end

  it "knows as casts to a specific type" do
    value : Int32 | String = "hello"
    # as tells compiler to treat as specific type (unsafe if wrong)
    str = value.as(String)
    str.upcase.should eq(__)
  end

  it "knows as? returns nil if cast fails" do
    value : Int32 | String = 42

    str_result = value.as?(String)
    str_result.should eq(__)

    int_result = value.as?(Int32)
    int_result.should eq(__)
  end

  it "knows arrays can have union element types" do
    arr : Array(Int32 | String) = [1, "two", 3, "four"]
    arr.size.should eq(__)
    arr[0].is_a?(Int32).should eq(__)
    arr[1].is_a?(String).should eq(__)
  end

  it "knows methods can return union types" do
    def maybe_number(give_number : Bool) : Int32 | Nil
      give_number ? 42 : nil
    end

    maybe_number(true).should eq(__)
    maybe_number(false).should eq(__)
  end

  it "knows compact removes nil from arrays" do
    arr : Array(Int32?) = [1, nil, 2, nil, 3]
    compacted = arr.compact
    compacted.should eq(__)
  end

  it "knows not_nil! asserts non-nil" do
    value : String? = "hello"
    result = value.not_nil!
    result.upcase.should eq(__)
  end

  it "knows union types work with hashes" do
    hash : Hash(String, Int32 | String) = {"count" => 5, "name" => "test"}
    hash["count"].is_a?(Int32).should eq(__)
    hash["name"].is_a?(String).should eq(__)
  end
end
