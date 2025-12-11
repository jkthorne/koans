require "../spec_helper"

# About Scope
#
# Scope determines where variables are visible and accessible.
# Crystal has local, instance (@), class (@@), and constant scopes.
# Understanding scope is crucial for writing maintainable code.

$global_value = "I am global"

module ScopeExamples
  CONSTANT = "I am a constant"
  @@class_var = "I am a class variable"

  class ScopeDemo
    @@shared = 0

    def initialize(@instance_var : String)
    end

    def instance_var
      @instance_var
    end

    def local_example
      local_var = "I am local"
      local_var
    end

    def self.class_var
      @@class_var
    end

    def self.increment_shared
      @@shared += 1
    end

    def self.shared
      @@shared
    end
  end
end

describe "About Scope" do
  it "knows local variables are scoped to their block" do
    x = 10
    if true
      y = 20
      x = x + y
    end
    # y is not accessible here
    x.should eq(__)
  end

  it "knows variables in blocks can shadow outer variables" do
    value = "outer"
    [1].each do |value|
      # This 'value' shadows the outer one inside this block
      value.should eq(__)
    end
    value.should eq(__)
  end

  it "knows instance variables are scoped to the object" do
    obj = ScopeExamples::ScopeDemo.new("hello")
    obj.instance_var.should eq(__)
  end

  it "knows each instance has its own instance variables" do
    obj1 = ScopeExamples::ScopeDemo.new("first")
    obj2 = ScopeExamples::ScopeDemo.new("second")
    obj1.instance_var.should eq(__)
    obj2.instance_var.should eq(__)
  end

  it "knows class variables are shared across all instances" do
    ScopeExamples::ScopeDemo.increment_shared
    ScopeExamples::ScopeDemo.increment_shared
    initial = ScopeExamples::ScopeDemo.shared

    ScopeExamples::ScopeDemo.increment_shared
    ScopeExamples::ScopeDemo.shared.should eq(__)
  end

  it "knows constants are accessible via namespace" do
    ScopeExamples::CONSTANT.should eq(__)
  end

  it "knows global variables are accessible everywhere" do
    $global_value.should eq(__)
  end

  it "knows local variables don't leak out of methods" do
    obj = ScopeExamples::ScopeDemo.new("test")
    result = obj.local_example
    result.should eq(__)
    # The local_var from local_example is not accessible here
  end

  it "knows blocks create a new scope but can access outer variables" do
    outer = 10
    result = [1, 2, 3].map do |x|
      x + outer  # outer is accessible
    end
    result.should eq(__)
  end

  it "knows blocks can modify outer variables" do
    counter = 0
    3.times { counter += 1 }
    counter.should eq(__)
  end

  it "knows if/unless don't create new scope" do
    if true
      created_inside = "visible"
    end
    created_inside.should eq(__)
  end

  it "knows case doesn't create new scope" do
    case 1
    when 1
      matched = "one"
    else
      matched = "other"
    end
    matched.should eq(__)
  end
end
