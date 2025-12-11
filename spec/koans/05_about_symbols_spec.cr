require "../spec_helper"

# About Symbols
#
# Symbols in Crystal are named identifiers that are immutable and unique.
# They are often used as keys, identifiers, and enum-like values.
# Symbols are interned, meaning each unique symbol exists only once in memory.

describe "About Symbols" do
  it "knows symbols are created with a colon" do
    symbol = :hello
    symbol.class.to_s.should eq(__)
  end

  it "knows symbols can be compared for equality" do
    (:hello == :hello).should eq(__)
    (:hello == :world).should eq(__)
  end

  it "knows identical symbols are equal" do
    # Symbols with the same name are always equal
    a = :crystal
    b = :crystal
    (a == b).should eq(__)
  end

  it "knows symbols can be converted to strings" do
    :hello.to_s.should eq(__)
  end

  it "knows symbols are not strings" do
    (:hello == "hello").should eq(__)
  end

  it "knows symbols can contain special characters with quotes" do
    # Symbols with spaces or special chars need quotes
    symbol = :"hello world"
    symbol.to_s.should eq(__)
  end

  it "knows symbols are often used as hash keys" do
    hash = {:name => "Crystal", :version => "1.0"}
    hash[:name].should eq(__)
  end

  it "knows the shorthand syntax for symbol keys" do
    # This is equivalent to {:name => "Crystal"}
    hash = {name: "Crystal", version: "1.0"}
    hash[:name].should eq(__)
    hash[:version].should eq(__)
  end

  it "knows symbols are memory efficient" do
    # Because symbols are interned, they use less memory than strings
    # for repeated values. This is why they're good as hash keys.
    # Let's verify they're equal
    hash1 = {status: "ok"}
    hash2 = {status: "ok"}
    # The symbol keys are identical
    (hash1.keys.first == hash2.keys.first).should eq(__)
  end
end
