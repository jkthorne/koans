require "../spec_helper"

# About Regular Expressions
#
# Regular expressions (regex) match patterns in strings.
# Crystal uses PCRE-compatible regex with /pattern/ syntax.
# They're powerful tools for text processing and validation.

describe "About Regular Expressions" do
  it "knows regex literals use slashes" do
    regex = /hello/
    regex.class.to_s.should eq(__)
  end

  it "knows =~ returns match position or nil" do
    result = "hello world" =~ /world/
    result.should eq(__)  # Position where match starts
  end

  it "knows =~ returns nil for no match" do
    result = "hello" =~ /world/
    result.should eq(__)
  end

  it "knows match returns MatchData or nil" do
    match = /hello/.match("say hello")
    match.should_not be_nil
    match.not_nil![0].should eq(__)
  end

  it "knows about capture groups with parentheses" do
    match = /(\d+)-(\d+)/.match("123-456")
    match.not_nil![1].should eq(__)
    match.not_nil![2].should eq(__)
  end

  it "knows about named capture groups" do
    match = /(?<year>\d{4})-(?<month>\d{2})/.match("2024-01")
    match.not_nil!["year"].should eq(__)
    match.not_nil!["month"].should eq(__)
  end

  it "knows about character classes" do
    # \d matches digits, \w matches word chars, \s matches whitespace
    "abc123".match(/\d+/).not_nil![0].should eq(__)
    "hello world".match(/\w+/).not_nil![0].should eq(__)
  end

  it "knows about quantifiers" do
    # * = 0+, + = 1+, ? = 0 or 1, {n} = exactly n
    "aaa".match(/a+/).not_nil![0].should eq(__)
    "abc".match(/a?b/).not_nil![0].should eq(__)
    "aaaa".match(/a{3}/).not_nil![0].should eq(__)
  end

  it "knows about anchors" do
    # ^ = start, $ = end
    "hello".match(/^hello$/).should_not be_nil
    "say hello".match(/^hello/).should eq(__)
    "hello world".match(/world$/).should_not be_nil
  end

  it "knows about alternation with |" do
    "cat".match(/cat|dog/).not_nil![0].should eq(__)
    "dog".match(/cat|dog/).not_nil![0].should eq(__)
  end

  it "knows about case insensitive matching" do
    "HELLO".match(/hello/i).should_not be_nil
    result = ("HELLO" =~ /hello/i) != nil
    result.should eq(__)
  end

  it "knows about gsub for replacement" do
    "hello world".gsub(/world/, "crystal").should eq(__)
  end

  it "knows gsub can use captures in replacement" do
    "John Smith".gsub(/(\w+) (\w+)/, "\\2, \\1").should eq(__)
  end

  it "knows about split with regex" do
    "a1b2c3".split(/\d/).should eq(__)
  end

  it "knows about scan for all matches" do
    matches = "a1b2c3".scan(/\d/)
    matches.map(&.[0]).should eq(__)
  end

  it "knows matches? returns boolean" do
    /\d+/.matches?("abc123").should eq(__)
    /\d+/.matches?("abc").should eq(__)
  end

  it "knows about email validation pattern" do
    email_pattern = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    email_pattern.matches?("user@example.com").should eq(__)
    email_pattern.matches?("not-an-email").should eq(__)
  end
end
