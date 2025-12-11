# Zen-inspired messages for Crystal Koans

module Koans
  module Messages
    WELCOME = <<-MSG

    ================================================================
                        Crystal Koans
    ================================================================

    "The path to enlightenment begins with a single step."

    In your journey to learn Crystal, you will walk the path of
    the koans. Each koan is a small lesson - a test that fails
    until you understand the truth it teaches.

    Fix the failing test. Run again. Repeat.

    Mountains are merely mountains.

    ================================================================

    MSG

    FAILURE_MESSAGES = [
      "The Master says: You have not yet reached enlightenment.",
      "A journey of a thousand miles begins beneath your feet.",
      "Do not seek to follow in the footsteps of the wise; seek what they sought.",
      "When you lose, do not lose the lesson.",
      "The obstacle is the path.",
      "Before enlightenment, chop wood, carry water. After enlightenment, chop wood, carry water.",
      "The only Zen you find on tops of mountains is the Zen you bring up there.",
      "Sit quietly, doing nothing, spring comes, and the grass grows by itself.",
      "When walking, walk. When eating, eat.",
      "To follow the path, look to the master, follow the master, walk with the master, see through the master, become the master.",
    ]

    PROGRESS_MESSAGES = {
      10 => "You are on the right path. Keep walking.",
      25 => "The journey continues. Your understanding deepens.",
      50 => "Halfway to enlightenment. The view improves from here.",
      75 => "The summit is within sight. Press on, weary traveler.",
      90 => "Almost there. The mountain reveals its final secrets.",
      95 => "Enlightenment is near. You can taste it.",
    }

    ENCOURAGEMENT = [
      "Think about what the test is really asking.",
      "Read the assertion carefully - the answer is in the question.",
      "Crystal is like Ruby, but with types. What type is expected?",
      "Sometimes the simplest answer is correct.",
      "Consider what you've learned in previous koans.",
    ]

    ENLIGHTENMENT = <<-MSG

    ================================================================
    *                                                              *
    *     Congratulations! You have achieved enlightenment!        *
    *                                                              *
    ================================================================

           _____
          /     \\
         /       \\
        |  o   o  |
        |    ^    |
        |  \\___/  |
         \\_______/
            | |
           _| |_
          |_____|

    "Mountains are mountains again. Water is water."

    You have completed all the koans.
    You have walked the path from confusion to clarity.
    Now go forth and write Crystal code with wisdom.

    Remember: The journey never truly ends.
    There is always more to learn.

    ================================================================

    MSG

    SECTION_COMPLETE = <<-MSG

    ----------------------------------------------------------------
    Section complete! You have gained wisdom.
    ----------------------------------------------------------------

    MSG

    def self.random_failure_message : String
      FAILURE_MESSAGES.sample
    end

    def self.random_encouragement : String
      ENCOURAGEMENT.sample
    end

    def self.progress_message(percent : Int32) : String?
      PROGRESS_MESSAGES.each do |threshold, message|
        return message if percent >= threshold && percent < threshold + 5
      end
      nil
    end
  end
end
