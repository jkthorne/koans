require "../spec_helper"

# About Concurrency (Crystal-specific)
#
# Crystal uses fibers for concurrency - lightweight threads managed
# by the runtime. Channels allow safe communication between fibers.
# This is similar to Go's goroutines and channels.

def async_compute(x : Int32) : Channel(Int32)
  channel = Channel(Int32).new
  spawn do
    channel.send(x * 2)
  end
  channel
end

describe "About Concurrency" do
  it "knows spawn creates a new fiber" do
    result = [] of String
    result << "before"

    spawn do
      result << "inside fiber"
    end

    result << "after spawn"
    Fiber.yield  # Give fiber a chance to run

    result.size.should eq(__)
  end

  it "knows fibers are cooperative" do
    order = [] of Int32

    spawn do
      order << 1
      Fiber.yield
      order << 3
    end

    spawn do
      order << 2
      Fiber.yield
      order << 4
    end

    # Wait for fibers
    4.times { Fiber.yield }
    sleep 0.01  # Small delay to ensure completion

    order.should eq(__)
  end

  it "knows channels pass values between fibers" do
    channel = Channel(Int32).new

    spawn do
      channel.send(42)
    end

    result = channel.receive
    result.should eq(__)
  end

  it "knows channels block until value is available" do
    channel = Channel(String).new
    received = ""

    spawn do
      sleep 0.01  # Small delay
      channel.send("hello from fiber")
    end

    received = channel.receive  # Blocks until send happens
    received.should eq(__)
  end

  it "knows channels can have capacity" do
    # Buffered channel can hold values without blocking
    channel = Channel(Int32).new(capacity: 2)

    channel.send(1)  # Doesn't block
    channel.send(2)  # Doesn't block

    channel.receive.should eq(__)
    channel.receive.should eq(__)
  end

  it "knows select waits on multiple channels" do
    ch1 = Channel(String).new
    ch2 = Channel(String).new

    spawn { ch1.send("from ch1") }
    spawn { ch2.send("from ch2") }

    results = [] of String
    2.times do
      select
      when msg = ch1.receive
        results << msg
      when msg = ch2.receive
        results << msg
      end
    end

    results.size.should eq(__)
    results.includes?("from ch1").should eq(__)
  end

  it "knows fibers can return values via channels" do
    ch = async_compute(21)
    ch.receive.should eq(__)
  end

  it "knows about closing channels" do
    channel = Channel(Int32).new

    spawn do
      channel.send(1)
      channel.send(2)
      channel.close
    end

    results = [] of Int32
    while value = channel.receive?
      results << value
    end

    results.should eq(__)
  end

  it "knows about fiber-safe iteration" do
    channel = Channel(Int32).new

    spawn do
      [1, 2, 3].each { |i| channel.send(i) }
      channel.close
    end

    sum = 0
    while value = channel.receive?
      sum += value
    end

    sum.should eq(__)
  end

  it "knows spawn name helps with debugging" do
    spawned = false

    spawn name: "worker" do
      spawned = true
    end

    Fiber.yield
    spawned.should eq(__)
  end

  it "knows about current fiber" do
    Fiber.current.class.to_s.should eq(__)
  end
end
