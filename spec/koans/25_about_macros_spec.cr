require "../spec_helper"

# About Macros (Crystal-specific)
#
# Macros are compile-time code generation. They run at compile time
# and generate Crystal code that gets compiled. Macros enable
# metaprogramming without runtime overhead.

macro define_method(name, value)
  def {{name.id}}
    {{value}}
  end
end

class MacroExample
  define_method greet, "Hello!"
  define_method answer, 42
end

macro generate_math_methods(operations)
  {% for op in operations %}
    def self.{{op[:name].id}}(a : Int32, b : Int32)
      a {{op[:operator].id}} b
    end
  {% end %}
end

class Calculator
  generate_math_methods([
    {name: "add", operator: "+"},
    {name: "subtract", operator: "-"},
    {name: "multiply", operator: "*"},
  ])
end

macro string_repeat(str, times)
  {% result = "" %}
  {% for i in 0...times %}
    {% result = result + str %}
  {% end %}
  {{result}}
end

# Macros must be defined at top level, not inside methods
macro make_constant(name, value)
  {{name.id}} = {{value}}
end

make_constant MACRO_CONST, 100

macro type_name(type)
  {{type.stringify}}
end

macro has_debug?
  {% if env("DEBUG") %}
    true
  {% else %}
    false
  {% end %}
end

macro describe_call(call)
  "Called: " + {{call.stringify}}
end

macro define_constants(values)
  {% for value, index in values %}
    CONST_{{index}} = {{value}}
  {% end %}
end

define_constants([10, 20, 30])

record MacroPoint, x : Int32, y : Int32

class MacroGetterExample
  getter name : String = "default"
end

describe "About Macros" do
  it "knows macros generate methods at compile time" do
    obj = MacroExample.new
    obj.greet.should eq(__)
    obj.answer.should eq(__)
  end

  it "knows macros can generate multiple methods" do
    Calculator.add(2, 3).should eq(__)
    Calculator.subtract(10, 4).should eq(__)
    Calculator.multiply(3, 4).should eq(__)
  end

  it "knows macros can do compile-time computation" do
    result = string_repeat("ab", 3)
    result.should eq(__)
  end

  it "knows {% %} executes macro code" do
    # {% ... %} runs code at compile time
    # {{ ... }} outputs code/values
    # Macro was defined at top level and created MACRO_CONST
    MACRO_CONST.should eq(__)
  end

  it "knows macros have access to type information" do
    # type_name macro was defined at top level
    type_name(String).should eq(__)
    type_name(Int32).should eq(__)
  end

  it "knows about the env macro method" do
    # env reads environment at compile time
    # This is useful for conditional compilation
    # The result depends on compile-time environment
    has_debug?.should eq(__)  # false unless DEBUG env var is set
  end

  it "knows about stringify for debugging" do
    # describe_call macro was defined at top level
    describe_call(foo.bar).should eq(__)
  end

  it "knows macros can iterate over collections" do
    # Constants were defined by define_constants macro at top level
    CONST_0.should eq(__)
    CONST_1.should eq(__)
    CONST_2.should eq(__)
  end

  it "knows record macro creates structs" do
    # MacroPoint was defined with record at top level
    p = MacroPoint.new(3, 4)
    p.x.should eq(__)
    p.y.should eq(__)
  end

  it "knows getter/setter are macros" do
    # MacroGetterExample was defined at top level
    obj = MacroGetterExample.new
    obj.name.should eq(__)
  end
end
