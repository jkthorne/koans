require "../spec_helper"

# About Strings
#
# Strings in Crystal are immutable sequences of UTF-8 characters.
# Unlike Ruby, Crystal strings cannot be modified in place.
# Crystal also has Char for single characters.

describe "About Strings" do
  it "knows strings are created with double quotes" do
    string = "hello"
    string.class.to_s.should eq(__)
  end

  it "knows the length of a string" do
    "crystal".size.should eq(__)
  end

  it "knows strings can be concatenated with +" do
    "hello" + " " + "world".should eq(__)
  end

  it "knows strings can be interpolated" do
    name = "Crystal"
    "Hello, #{name}!".should eq(__)
  end

  it "knows interpolation can contain expressions" do
    "2 + 2 = #{2 + 2}".should eq(__)
  end

  it "knows single quotes create characters, not strings" do
    # In Crystal, single quotes create Char, not String
    char = 'a'
    char.class.to_s.should eq(__)
  end

  it "knows strings can be accessed by index" do
    string = "crystal"
    string[0].should eq(__)  # Returns a Char
    string[1].should eq(__)
  end

  it "knows negative indices count from the end" do
    string = "crystal"
    string[-1].should eq(__)
    string[-2].should eq(__)
  end

  it "knows slicing with ranges" do
    string = "crystal"
    string[0..2].should eq(__)   # inclusive
    string[0...2].should eq(__)  # exclusive
  end

  it "knows about string methods for case" do
    "hello".upcase.should eq(__)
    "HELLO".downcase.should eq(__)
    "hello".capitalize.should eq(__)
  end

  it "knows about stripping whitespace" do
    "  hello  ".strip.should eq(__)
    "  hello  ".lstrip.should eq(__)
    "  hello  ".rstrip.should eq(__)
  end

  it "knows about splitting strings" do
    "a,b,c".split(",").should eq(__)
    "hello world".split.should eq(__)
  end

  it "knows about joining arrays into strings" do
    ["a", "b", "c"].join("-").should eq(__)
  end

  it "knows about replacing substrings" do
    "hello world".gsub("world", "crystal").should eq(__)
    "hello".gsub('l', 'L').should eq(__)
  end

  it "knows about checking string content" do
    "hello".includes?("ell").should eq(__)
    "hello".starts_with?("he").should eq(__)
    "hello".ends_with?("lo").should eq(__)
  end

  it "knows about empty strings" do
    "".empty?.should eq(__)
    "hello".empty?.should eq(__)
    "".blank?.should eq(__)
    "   ".blank?.should eq(__)
  end

  it "knows strings are compared lexicographically" do
    ("apple" < "banana").should eq(__)
    ("apple" == "apple").should eq(__)
    ("Apple" < "apple").should eq(__)  # uppercase comes first
  end

  it "knows about multiline strings" do
    multiline = "line1\nline2\nline3"
    multiline.lines.size.should eq(__)
  end

  it "knows heredocs for multiline strings" do
    heredoc = <<-TEXT
    This is a
    multiline string
    TEXT
    heredoc.includes?("multiline").should eq(__)
  end

  it "knows about reversing strings" do
    "hello".reverse.should eq(__)
  end

  it "knows about repeating strings" do
    "ab" * 3.should eq(__)
  end

  it "knows about converting to and from strings" do
    42.to_s.should eq(__)
    "42".to_i.should eq(__)
    "3.14".to_f.should be_close(__, 0.001)
  end

  it "knows about chars in strings" do
    chars = "abc".chars
    chars.should eq(__)
    chars.first.should eq(__)
  end

  it "knows about byte access" do
    # Each char is one or more bytes in UTF-8
    "a".bytes.first.should eq(__)  # ASCII value of 'a'
  end
end
