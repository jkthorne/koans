require "../spec_helper"

# About Hashes
#
# Hashes (also called dictionaries or maps) store key-value pairs.
# In Crystal, hashes are typed - both keys and values have types.
# Hashes provide fast O(1) lookup by key.

describe "About Hashes" do
  it "knows hashes are created with braces" do
    hash = {"one" => 1, "two" => 2}
    hash.class.to_s.should eq(__)
  end

  it "knows values can be accessed by key" do
    hash = {"name" => "Crystal", "version" => "1.0"}
    hash["name"].should eq(__)
    hash["version"].should eq(__)
  end

  it "knows about the size of a hash" do
    hash = {a: 1, b: 2, c: 3}
    hash.size.should eq(__)
  end

  it "knows symbol keys can use shorthand syntax" do
    hash = {name: "Crystal", version: "1.0"}
    hash[:name].should eq(__)
  end

  it "knows values can be set" do
    hash = {:a => 1, :b => 2}
    hash[:c] = 3
    hash[:c].should eq(__)
    hash.size.should eq(__)
  end

  it "knows existing values can be updated" do
    hash = {:count => 1}
    hash[:count] = 2
    hash[:count].should eq(__)
  end

  it "knows about checking for keys" do
    hash = {:name => "Crystal"}
    hash.has_key?(:name).should eq(__)
    hash.has_key?(:version).should eq(__)
  end

  it "knows about checking for values" do
    hash = {:name => "Crystal"}
    hash.has_value?("Crystal").should eq(__)
    hash.has_value?("Ruby").should eq(__)
  end

  it "knows about getting keys and values" do
    hash = {:a => 1, :b => 2}
    hash.keys.should eq(__)
    hash.values.should eq(__)
  end

  it "knows about safe access with []?" do
    hash = {:a => 1}
    hash[:a]?.should eq(__)
    hash[:b]?.should eq(__)  # Returns nil for missing key
  end

  it "knows about fetch with default" do
    hash = {:a => 1}
    hash.fetch(:a, 0).should eq(__)
    hash.fetch(:b, 0).should eq(__)
  end

  it "knows about deleting keys" do
    hash = {:a => 1, :b => 2}
    deleted = hash.delete(:a)
    deleted.should eq(__)
    hash.has_key?(:a).should eq(__)
  end

  it "knows about iterating over hashes" do
    hash = {:a => 1, :b => 2}
    keys = [] of Symbol
    values = [] of Int32

    hash.each do |key, value|
      keys << key
      values << value
    end

    keys.should eq(__)
    values.should eq(__)
  end

  it "knows about mapping hash values" do
    hash = {:a => 1, :b => 2}
    result = hash.transform_values { |v| v * 10 }
    result.should eq(__)
  end

  it "knows about selecting from hashes" do
    hash = {:a => 1, :b => 2, :c => 3}
    result = hash.select { |k, v| v > 1 }
    result.should eq(__)
  end

  it "knows about merging hashes" do
    hash1 = {:a => 1, :b => 2}
    hash2 = {:b => 20, :c => 30}
    result = hash1.merge(hash2)
    result.should eq(__)
  end

  it "knows about empty hashes" do
    ({} of Symbol => Int32).empty?.should eq(__)
    {a: 1}.empty?.should eq(__)
  end

  it "knows about clearing hashes" do
    hash = {:a => 1, :b => 2}
    hash.clear
    hash.size.should eq(__)
  end

  it "knows about converting to array" do
    hash = {:a => 1, :b => 2}
    hash.to_a.should eq(__)
  end

  it "knows about invert" do
    hash = {:a => 1, :b => 2}
    hash.invert.should eq(__)
  end

  it "knows hashes preserve insertion order" do
    hash = {} of Symbol => Int32
    hash[:c] = 3
    hash[:a] = 1
    hash[:b] = 2
    hash.keys.should eq(__)
  end
end
