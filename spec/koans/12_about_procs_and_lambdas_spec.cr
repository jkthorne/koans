require "../spec_helper"

# About Procs and Lambdas
#
# Procs are objects that represent blocks of code that can be
# stored in variables and called later. In Crystal, we use
# Proc objects and the -> syntax to create them.

describe "About Procs and Lambdas" do
  it "knows procs are created with ->" do
    my_proc = -> { "Hello from proc!" }
    my_proc.call.should eq(__)
  end

  it "knows procs can take parameters" do
    add = ->(a : Int32, b : Int32) { a + b }
    add.call(2, 3).should eq(__)
  end

  it "knows procs have a type" do
    my_proc = -> { 42 }
    my_proc.class.to_s.should eq(__)
  end

  it "knows procs can be stored in variables" do
    greet = ->(name : String) { "Hello, #{name}!" }
    result = greet.call("Crystal")
    result.should eq(__)
  end

  it "knows procs can capture variables from outer scope" do
    multiplier = 10
    multiply = ->(x : Int32) { x * multiplier }
    multiply.call(5).should eq(__)
  end

  it "knows procs can be passed to methods" do
    def apply_twice(value : Int32, &operation : Int32 -> Int32)
      operation.call(operation.call(value))
    end

    result = apply_twice(3) { |x| x * 2 }
    result.should eq(__)  # (3 * 2) * 2
  end

  it "knows about converting blocks to procs" do
    def execute(&block : -> String)
      block.call
    end

    result = execute { "executed!" }
    result.should eq(__)
  end

  it "knows procs can be assigned and called later" do
    operations = [] of Proc(Int32, Int32)
    operations << ->(x : Int32) { x + 1 }
    operations << ->(x : Int32) { x * 2 }

    value = 5
    operations.each { |op| value = op.call(value) }
    value.should eq(__)  # (5 + 1) * 2
  end

  it "knows about multi-line procs" do
    calculate = ->(x : Int32) {
      doubled = x * 2
      doubled + 10
    }
    calculate.call(5).should eq(__)
  end

  it "knows procs can return procs" do
    make_adder = ->(amount : Int32) {
      ->(x : Int32) { x + amount }
    }

    add_five = make_adder.call(5)
    add_five.call(10).should eq(__)
  end

  it "knows procs can be used for callbacks" do
    def with_callback(value : Int32, &callback : Int32 -> Int32) : Int32
      callback.call(value * 2)
    end

    result = with_callback(5) { |x| x + 3 }
    result.should eq(__)  # (5 * 2) + 3
  end

  it "knows about partial for creating partial applications" do
    # Crystal doesn't have built-in partial, but we can achieve it
    full_greet = ->(greeting : String, name : String) {
      "#{greeting}, #{name}!"
    }

    hello_greet = ->(name : String) { full_greet.call("Hello", name) }
    hello_greet.call("Crystal").should eq(__)
  end
end
