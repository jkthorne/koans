require "../spec_helper"

# About Constants
#
# Constants in Crystal start with an uppercase letter.
# By convention, they are written in SCREAMING_SNAKE_CASE.
# Constants are evaluated at compile time when possible.

MAX_SIZE = 100
DEFAULT_NAME = "Unknown"
PI_APPROX = 3.14159

module ConstantExamples
  VERSION = "1.0.0"
  MAX_RETRIES = 3

  class Config
    TIMEOUT = 30
    DEBUG = false

    def self.timeout
      TIMEOUT
    end
  end

  module Nested
    INNER_VALUE = "nested"
  end
end

class ConstantHolder
  MY_CONSTANT = "from class"

  def get_constant
    MY_CONSTANT
  end
end

describe "About Constants" do
  it "knows constants start with uppercase" do
    MAX_SIZE.should eq(__)
  end

  it "knows constants can be strings" do
    DEFAULT_NAME.should eq(__)
  end

  it "knows constants can be floats" do
    PI_APPROX.should be_close(__, 0.001)
  end

  it "knows constants in modules use :: accessor" do
    ConstantExamples::VERSION.should eq(__)
    ConstantExamples::MAX_RETRIES.should eq(__)
  end

  it "knows nested constants use multiple ::" do
    ConstantExamples::Config::TIMEOUT.should eq(__)
    ConstantExamples::Config::DEBUG.should eq(__)
  end

  it "knows deeply nested constants" do
    ConstantExamples::Nested::INNER_VALUE.should eq(__)
  end

  it "knows classes can have constants" do
    ConstantHolder::MY_CONSTANT.should eq(__)
  end

  it "knows instance methods can access class constants" do
    holder = ConstantHolder.new
    holder.get_constant.should eq(__)
  end

  it "knows constants can be arrays" do
    VALID_STATES = ["pending", "active", "done"]
    VALID_STATES.size.should eq(__)
    VALID_STATES.first.should eq(__)
  end

  it "knows constants can be hashes" do
    CONFIG = {timeout: 30, retries: 3}
    CONFIG[:timeout].should eq(__)
  end

  it "knows constants can reference other constants" do
    BASE = 10
    DOUBLED = BASE * 2
    DOUBLED.should eq(__)
  end

  it "knows Math module has useful constants" do
    Math::PI.should be_close(__, 0.0001)
    Math::E.should be_close(__, 0.0001)
  end

  it "knows type names are constants" do
    # Class and module names are constants
    String.should eq(__)
    Int32.should eq(__)
  end
end
