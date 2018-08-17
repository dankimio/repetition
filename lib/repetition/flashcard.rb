#
# The Repetition module uses the Super Memo method to determine when to next
# review an item. The quality values are as follows:
#
# 5 - perfect response
# 4 - correct response after a hesitation
# 3 - correct response recalled with serious difficulty
# 2 - incorrect response; where the correct one seemed easy to recall
# 1 - incorrect response; the correct one remembered
# 0 - complete blackout
#
# Find out more here: https://www.supermemo.com/english/ol/sm2.htm
#

require 'date'

module Repetition
  class Flashcard
    attr_reader :easiness_factor, :interval, :repetitions

    def initialize(easiness_factor: 2.5, interval: 0, repetitions: 0)
      @easiness_factor = easiness_factor
      @interval = interval
      @repetitions = repetitions
    end

    def recall(quality)
      raise ArgumentError, 'Invalid quality of recall. Should be in range from 0 to 5.' unless (0..5).cover?(quality)

      if quality < 3
        # An incorrect recall is reset back to the beginning
        @repetitions = 0
        @interval = 0
      elsif quality == 3
        # The item was correctly recalled but should be tested again quickly
        @interval = 0
      else
        # The item was correctly recalled and we can review later on
        @repetitions += 1

        case @repetitions
        when 1
          @interval = 1
        when 2
          @interval = 6
        else
          @easiness_factor = calculate_easiness_factor(@easiness_factor, quality)
          @interval = @interval * @easiness_factor
        end
      end

      due_on
    end

    def due_on
      today + @interval
    end

    private

    def today
      @today ||= Date.today
    end

    def calculate_easiness_factor(easiness_factor, quality)
      result = easiness_factor - 0.8 + (0.28 * quality) - (0.02 * quality * quality)
      result < 1.3 ? 1.3 : result
    end
  end
end
