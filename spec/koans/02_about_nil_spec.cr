require "../spec_helper"

# About Nil
#
# In Crystal, nil is a first-class value representing "nothing" or "absence".
# Unlike Ruby, Crystal is type-safe, so nil must be handled explicitly.
# This is one of Crystal's greatest strengths for preventing null pointer errors.

describe "About Nil" do
  it "knows that nil is an object" do
    # nil is an instance of the Nil type
    nil.class.to_s.should eq(__)
  end

  it "knows nil responds to certain methods" do
    # nil has some useful methods
    nil.nil?.should eq(__)
  end

  it "knows nil converts to string" do
    # What does nil look like as a string?
    nil.to_s.should eq(__)
  end

  it "knows nil converts to inspect string" do
    # inspect gives a programmer-friendly representation
    nil.inspect.should eq(__)
  end

  it "can use try to safely call methods on nil" do
    # try returns nil if the receiver is nil, otherwise calls the method
    value : String? = nil
    result = value.try &.upcase
    result.should eq(__)
  end

  it "can use try on non-nil values" do
    # try works normally on non-nil values
    value : String? = "hello"
    result = value.try &.upcase
    result.should eq(__)
  end

  it "uses not_nil! to assert a value is not nil" do
    # not_nil! raises if the value is nil
    # Use it when you're certain a value won't be nil
    value : String? = "crystal"
    result = value.not_nil!
    result.should eq(__)
  end

  it "knows the || operator provides a default for nil" do
    # || returns the first truthy value
    value : String? = nil
    result = value || "default"
    result.should eq(__)
  end

  it "knows that non-nil values are returned by ||" do
    value : String? = "actual"
    result = value || "default"
    result.should eq(__)
  end

  it "knows nil is falsy in conditionals" do
    # nil is one of only two falsy values in Crystal
    value = nil
    result = if value
               "truthy"
             else
               "falsy"
             end
    result.should eq(__)
  end

  it "knows false is also falsy" do
    # false is the other falsy value
    value = false
    result = value ? "truthy" : "falsy"
    result.should eq(__)
  end

  it "knows everything else is truthy" do
    # Unlike some languages, 0 and "" are truthy in Crystal
    zero_is_truthy = 0 ? true : false
    zero_is_truthy.should eq(__)

    empty_string_is_truthy = "" ? true : false
    empty_string_is_truthy.should eq(__)
  end
end
