#
# The Repetition module uses the Super Memo method to determine when to next
# review an item. The quality_of_recall values are as follows:
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
require 'repetition/version'
require 'date'
module Repetition
  def process_recall_result(quality_of_recall, date_of_recall = Date.today)
    unless (0..5).include?(quality_of_recall)
      raise 'Invalid quality of recall. Should be in range from 0 to 5.'
    end

    # Initialize values if they aren't set
    self.easiness_factor ||= 2.5
    self.number_repetitions ||= 0
    self.repetition_interval ||= 0

    if quality_of_recall < 3
      # An incorrect recall is reset back to the beginning
      self.number_repetitions = 0
      self.repetition_interval = 0

    elsif quality_of_recall == 3
      # The item was correctly recalled but should be tested again quickly
      self.repetition_interval = 0

    else
      # The item was correctly recalled and we can review later on
      self.number_repetitions += 1

      case number_repetitions
      when 1
        self.repetition_interval = 1
      when 2
        self.repetition_interval = 6
      else
        self.easiness_factor = calculate_easiness_factor(easiness_factor, quality_of_recall)
        self.repetition_interval = repetition_interval * easiness_factor
      end
    end

    self.next_repetition = date_of_recall + repetition_interval
    self.last_studied = date_of_recall
  end

  def scheduled_to_recall?
    !next_repetition.nil? && next_repetition <= Date.today
  end

  private

  def calculate_easiness_factor(easiness_factor, quality_of_recall)
    result = easiness_factor - 0.8 + (0.28 * quality_of_recall) - (0.02 * quality_of_recall * quality_of_recall)
    result < 1.3 ? 1.3 : result
  end
end
