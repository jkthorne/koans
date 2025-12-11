# Crystal Koans - Path to Enlightenment
#
# This is the main entry point for the guided koan experience.
# Run with: crystal run src/path_to_enlightenment.cr
#
# The path will guide you through each koan in order, stopping
# at the first failure so you can contemplate and fix it.

require "./koans"
require "./support/placeholder"
require "./support/messages"
require "./support/progress"
require "./support/runner"
require "colorize"

module Koans
  class PathToEnlightenment
    KOAN_FILES = [
      "01_about_asserts",
      "02_about_nil",
      "03_about_numbers",
      "04_about_strings",
      "05_about_symbols",
      "06_about_arrays",
      "07_about_hashes",
      "08_about_control_statements",
      "09_about_true_and_false",
      "10_about_methods",
      "11_about_blocks",
      "12_about_procs_and_lambdas",
      "13_about_classes",
      "14_about_inheritance",
      "15_about_modules",
      "16_about_scope",
      "17_about_self",
      "18_about_constants",
      "19_about_method_visibility",
      "20_about_exceptions",
      "21_about_union_types",
      "22_about_type_inference",
      "23_about_generics",
      "24_about_enums",
      "25_about_macros",
      "26_about_concurrency",
      "27_about_regular_expressions",
      "28_about_open_classes",
      "29_about_structs",
      "30_about_tuples",
    ]

    @progress : Progress
    @start_time : Time
    @passed_count : Int32 = 0

    def initialize
      @progress = Progress.new
      @start_time = Time.utc
    end

    def run
      display_welcome
      run_koans
    end

    private def display_welcome
      puts Messages::WELCOME.colorize(:cyan)
      puts ""
    end

    private def run_koans
      total = KOAN_FILES.size

      KOAN_FILES.each_with_index do |koan, index|
        spec_file = "spec/koans/#{koan}_spec.cr"

        unless File.exists?(spec_file)
          puts "  #{"?".colorize(:yellow)} #{koan} - file not found, skipping"
          next
        end

        # Check if already passed and unchanged
        if @progress.passed?(koan, spec_file)
          @passed_count += 1
          print "  #{"✓".colorize(:green)} #{koan}"
          print " (cached)".colorize(:dark_gray)
          puts ""
          next
        end

        # Run the spec
        print "  #{"▶".colorize(:blue)} #{koan}..."

        result = Runner.run_spec(spec_file)

        if result.success
          @passed_count += 1
          @progress.record_pass(koan, spec_file)
          print "\r  #{"✓".colorize(:green)} #{koan}      \n"

          # Check for milestone messages
          percent = (@passed_count.to_f / total * 100).to_i
          if msg = Messages.progress_message(percent)
            puts ""
            puts "  #{msg}".colorize(:cyan)
            puts ""
          end
        else
          print "\r  #{"✗".colorize(:red)} #{koan}      \n"
          display_failure(koan, spec_file, result)
          return # Stop at first failure
        end
      end

      # All koans passed!
      display_enlightenment
    end

    private def display_failure(koan : String, file : String, result : Runner::Result)
      puts ""
      puts "=" * 60
      puts Messages.random_failure_message.colorize(:yellow)
      puts "=" * 60
      puts ""

      puts "Progress: #{Runner.progress_bar(@passed_count, KOAN_FILES.size)}"
      puts ""

      puts "Meditate on the following:".colorize(:cyan)
      puts ""
      puts "  File: #{file}".colorize(:white)

      # Show relevant output
      output = result.output + result.error
      if output.includes?("Expected") || output.includes?("Failure")
        puts ""
        output.lines.each do |line|
          if line.includes?("Expected") || line.includes?("got:") || line.includes?("Failure")
            puts "  #{line.strip}".colorize(:red)
          elsif line.includes?("spec/koans") && line.includes?(".cr:")
            puts "  #{line.strip}".colorize(:yellow)
          end
        end
      end

      puts ""
      puts "Hint: #{Messages.random_encouragement}".colorize(:dark_gray)
      puts ""
      puts "Fix the failing test, then run again.".colorize(:white)
      puts ""

      duration = (Time.utc - @start_time).total_seconds
      puts "Time: #{Runner.format_duration(duration)}".colorize(:dark_gray)
    end

    private def display_enlightenment
      puts ""
      puts Messages::ENLIGHTENMENT.colorize(:green)

      duration = (Time.utc - @start_time).total_seconds
      puts "Total time: #{Runner.format_duration(duration)}".colorize(:cyan)
      puts "Koans completed: #{KOAN_FILES.size}".colorize(:cyan)
      puts ""
    end
  end
end

# Handle command line arguments
if ARGV.includes?("--reset")
  puts "Resetting progress..."
  Koans::Progress.new.clear_all
  puts "Progress cleared. Run again to start fresh."
  exit 0
end

if ARGV.includes?("--help") || ARGV.includes?("-h")
  puts <<-HELP
  Crystal Koans - Path to Enlightenment

  Usage: crystal run src/path_to_enlightenment.cr [options]

  Options:
    --reset    Clear all progress and start fresh
    --help     Show this help message

  The path will guide you through each koan in order.
  Fix each failing test to progress toward enlightenment.
  HELP
  exit 0
end

# Start the journey
Koans::PathToEnlightenment.new.run
