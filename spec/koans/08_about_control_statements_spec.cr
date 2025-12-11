require "../spec_helper"

# About Control Statements
#
# Control flow in Crystal is similar to Ruby but with some
# type-safety considerations. Conditionals, loops, and case
# statements guide the execution of your code.

describe "About Control Statements" do
  it "knows if statements evaluate conditions" do
    result = if true
               "true branch"
             else
               "false branch"
             end
    result.should eq(__)
  end

  it "knows if returns a value" do
    value = 5
    result = if value > 3
               "big"
             else
               "small"
             end
    result.should eq(__)
  end

  it "knows about elsif for multiple conditions" do
    value = 5
    result = if value < 3
               "small"
             elsif value < 7
               "medium"
             else
               "large"
             end
    result.should eq(__)
  end

  it "knows about unless (negative if)" do
    result = unless false
               "executed"
             else
               "not executed"
             end
    result.should eq(__)
  end

  it "knows about single-line if" do
    value = 10
    result = "big" if value > 5
    result.should eq(__)
  end

  it "knows about the ternary operator" do
    value = 10
    result = value > 5 ? "big" : "small"
    result.should eq(__)
  end

  it "knows about case/when statements" do
    value = "b"
    result = case value
             when "a" then "first"
             when "b" then "second"
             when "c" then "third"
             else          "other"
             end
    result.should eq(__)
  end

  it "knows case can match multiple values" do
    value = 2
    result = case value
             when 1, 2, 3 then "small"
             when 4, 5, 6 then "medium"
             else              "large"
             end
    result.should eq(__)
  end

  it "knows case can match ranges" do
    value = 50
    result = case value
             when 0..25   then "low"
             when 26..75  then "medium"
             when 76..100 then "high"
             else              "out of range"
             end
    result.should eq(__)
  end

  it "knows case can match types" do
    value : Int32 | String = "hello"
    result = case value
             when Int32 then "number"
             when String then "text"
             else             "unknown"
             end
    result.should eq(__)
  end

  it "knows about while loops" do
    counter = 0
    result = 0
    while counter < 5
      result += counter
      counter += 1
    end
    result.should eq(__)  # 0 + 1 + 2 + 3 + 4
  end

  it "knows about until loops" do
    counter = 0
    result = 0
    until counter >= 5
      result += counter
      counter += 1
    end
    result.should eq(__)
  end

  it "knows about loop with break" do
    counter = 0
    result = 0
    loop do
      result += counter
      counter += 1
      break if counter >= 3
    end
    result.should eq(__)  # 0 + 1 + 2
  end

  it "knows about next to skip iterations" do
    result = [] of Int32
    (1..5).each do |i|
      next if i.even?
      result << i
    end
    result.should eq(__)
  end

  it "knows && is short-circuit and" do
    # && returns the first falsy value or the last value
    result = true && "second"
    result.should eq(__)

    result2 = false && "second"
    result2.should eq(__)
  end

  it "knows || is short-circuit or" do
    # || returns the first truthy value or the last value
    result = nil || "default"
    result.should eq(__)

    result2 = "first" || "second"
    result2.should eq(__)
  end

  it "knows about if with assignment" do
    # if can be used with assignment for nil checks
    hash = {a: 1}
    if value = hash[:a]?
      result = value * 2
    else
      result = 0
    end
    result.should eq(__)
  end
end
