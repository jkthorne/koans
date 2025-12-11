require "../spec_helper"

# About Exceptions
#
# Exceptions handle error conditions in Crystal.
# Use raise to throw an exception, rescue to catch it.
# Crystal's exceptions are similar to Ruby's.

class CustomError < Exception
end

class ValidationError < Exception
  getter field : String

  def initialize(@field : String, message : String)
    super(message)
  end
end

def divide(a : Int32, b : Int32) : Int32
  raise "Division by zero!" if b == 0
  a // b
end

def validate_age(age : Int32) : String
  raise ValidationError.new("age", "Age must be positive") if age < 0
  raise ValidationError.new("age", "Age seems unrealistic") if age > 150
  "Valid age: #{age}"
end

def risky_operation(should_fail : Bool)
  raise "Something went wrong!" if should_fail
  "Success!"
end

def with_cleanup(should_fail : Bool)
  result = "started"
  begin
    raise "Error!" if should_fail
    result = "completed"
  ensure
    result += " (cleaned up)"
  end
  result
end

def multi_error(type : Int32)
  case type
  when 1 then raise ArgumentError.new("bad arg")
  when 2 then raise IndexError.new("bad index")
  else        "ok"
  end
end

describe "About Exceptions" do
  it "knows exceptions can be raised with raise" do
    expect_raises(Exception) do
      raise "An error occurred"
    end
    # If we get here, the test passed
    true.should eq(__)
  end

  it "knows exceptions can be rescued" do
    result = begin
      raise "Error!"
      "no error"
    rescue
      "caught error"
    end
    result.should eq(__)
  end

  it "knows rescued exceptions have a message" do
    message = begin
      raise "Something bad happened"
      ""
    rescue ex
      ex.message
    end
    message.should eq(__)
  end

  it "knows custom exception classes can be created" do
    expect_raises(CustomError) do
      raise CustomError.new("Custom error message")
    end
    true.should eq(__)
  end

  it "knows specific exceptions can be rescued" do
    result = begin
      raise CustomError.new("Oops")
    rescue CustomError
      "caught custom"
    rescue Exception
      "caught generic"
    end
    result.should eq(__)
  end

  it "knows exceptions can have custom fields" do
    result = begin
      validate_age(-5)
    rescue ex : ValidationError
      ex.field
    end
    result.should eq(__)
  end

  it "knows ensure runs regardless of exceptions" do
    result = with_cleanup(false)
    result.should eq(__)
  end

  it "knows ensure runs even when exception occurs" do
    result = begin
      with_cleanup(true)
    rescue
      "error occurred"
    end
    # The cleanup still happened internally
    result.should eq(__)
  end

  it "knows exception-free code returns normally" do
    result = begin
      divide(10, 2)
    rescue
      0
    end
    result.should eq(__)
  end

  it "knows division by zero raises an exception" do
    result = begin
      divide(10, 0)
    rescue
      -1
    end
    result.should eq(__)
  end

  it "knows else runs when no exception occurs" do
    result = begin
      "no error"
    rescue
      "error"
    else
      "else block"
    end
    result.should eq(__)
  end

  it "knows multiple exception types can be rescued" do
    result1 = begin
      multi_error(1)
    rescue ArgumentError
      "argument"
    rescue IndexError
      "index"
    end

    result2 = begin
      multi_error(2)
    rescue ArgumentError
      "argument"
    rescue IndexError
      "index"
    end

    result1.should eq(__)
    result2.should eq(__)
  end
end
