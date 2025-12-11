require "../spec_helper"

# About True and False
#
# Crystal has only two falsy values: nil and false.
# Everything else is truthy. This is simpler than some
# languages where 0, "", or [] might be falsy.

describe "About True and False" do
  it "knows true is a Bool" do
    true.class.to_s.should eq(__)
  end

  it "knows false is a Bool" do
    false.class.to_s.should eq(__)
  end

  it "knows nil is falsy" do
    result = nil ? "truthy" : "falsy"
    result.should eq(__)
  end

  it "knows false is falsy" do
    result = false ? "truthy" : "falsy"
    result.should eq(__)
  end

  it "knows zero is truthy" do
    # Unlike some languages, 0 is truthy in Crystal
    result = 0 ? "truthy" : "falsy"
    result.should eq(__)
  end

  it "knows empty string is truthy" do
    result = "" ? "truthy" : "falsy"
    result.should eq(__)
  end

  it "knows empty array is truthy" do
    result = ([] of Int32) ? "truthy" : "falsy"
    result.should eq(__)
  end

  it "knows empty hash is truthy" do
    result = ({} of String => Int32) ? "truthy" : "falsy"
    result.should eq(__)
  end

  it "knows about the not operator" do
    (!true).should eq(__)
    (!false).should eq(__)
    (!nil).should eq(__)
  end

  it "knows about double negation" do
    # !! converts to boolean
    (!!0).should eq(__)
    (!!nil).should eq(__)
    (!!"hello").should eq(__)
  end

  it "knows and operations" do
    (true && true).should eq(__)
    (true && false).should eq(__)
    (false && true).should eq(__)
    (false && false).should eq(__)
  end

  it "knows or operations" do
    (true || true).should eq(__)
    (true || false).should eq(__)
    (false || true).should eq(__)
    (false || false).should eq(__)
  end

  it "knows && returns values, not just booleans" do
    # && returns first falsy value or last value
    ("a" && "b").should eq(__)
    (nil && "b").should eq(__)
  end

  it "knows || returns values, not just booleans" do
    # || returns first truthy value or last value
    ("a" || "b").should eq(__)
    (nil || "b").should eq(__)
    (false || nil).should eq(__)
  end

  it "knows about equality with ==" do
    (true == true).should eq(__)
    (false == false).should eq(__)
    (true == false).should eq(__)
  end

  it "knows nil is not false" do
    (nil == false).should eq(__)
  end

  it "knows about boolean methods" do
    true.to_s.should eq(__)
    false.to_s.should eq(__)
  end
end
