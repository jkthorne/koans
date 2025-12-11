# Test runner utilities for Crystal Koans

require "colorize"

module Koans
  class Runner
    struct Result
      property success : Bool
      property output : String
      property error : String

      def initialize(@success : Bool, @output : String, @error : String)
      end
    end

    # Run a single spec file and return the result
    def self.run_spec(file : String) : Result
      output = IO::Memory.new
      error = IO::Memory.new

      status = Process.run(
        "crystal",
        ["spec", file, "--no-color"],
        output: output,
        error: error
      )

      Result.new(
        success: status.success?,
        output: output.to_s,
        error: error.to_s
      )
    end

    # Parse spec output to extract failure information
    def self.parse_failure(output : String) : NamedTuple(file: String?, line: String?, test: String?, message: String?)
      file = nil
      line = nil
      test = nil
      message = nil

      lines = output.lines

      # Look for the failure location
      lines.each_with_index do |l, i|
        if l.includes?("Failure/Error") || l.includes?("Failed")
          # Try to extract test name from context
          if i > 0
            test = lines[i - 1].strip if lines[i - 1].includes?("it ")
          end
        end

        # Extract file:line from spec output
        if match = l.match(/# (.*?):(\d+)/)
          file = match[1]
          line = match[2]
        elsif match = l.match(/(spec\/.*?\.cr):(\d+)/)
          file = match[1]
          line = match[2]
        end

        # Extract expected vs got
        if l.includes?("Expected:")
          message = l.strip
          if i + 1 < lines.size && lines[i + 1].includes?("got:")
            message += "\n" + lines[i + 1].strip
          end
        end
      end

      {file: file, line: line, test: test, message: message}
    end

    # Display a progress bar
    def self.progress_bar(current : Int32, total : Int32, width : Int32 = 40) : String
      return "[" + "=" * width + "] 100%" if current >= total

      percent = (current.to_f / total * 100).to_i
      filled = (current.to_f / total * width).to_i
      empty = width - filled

      "[" + "#" * filled + "." * empty + "] #{percent}% (#{current}/#{total})"
    end

    # Format duration nicely
    def self.format_duration(seconds : Float64) : String
      if seconds < 1
        "#{(seconds * 1000).to_i}ms"
      elsif seconds < 60
        "#{seconds.round(1)}s"
      else
        minutes = (seconds / 60).to_i
        secs = (seconds % 60).to_i
        "#{minutes}m #{secs}s"
      end
    end
  end
end
