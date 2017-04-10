require 'repetition/version'

require 'date'

module Repetition
  def reset_spaced_repetition_data
    self.easiness_factor = 2.5
    self.number_repetitions = 0
    self.quality_of_last_recall = nil
    self.repetition_interval = nil
    self.next_repetition = nil
    self.last_studied = nil
  end

  def process_recall_result(quality_of_recall)
    unless (0..5).include?(quality_of_recall)
      raise 'Invalid quality of recall. Should be in range from 0 to 5.'
    end

    if quality_of_recall < 3
      self.number_repetitions = 0
      self.repetition_interval = 0
    else
      self.easiness_factor = calculate_easiness_factor(easiness_factor, quality_of_recall)

      if quality_of_recall == 3
        self.repetition_interval = 0
      else
        self.number_repetitions += 1

        case number_repetitions
        when 1
          self.repetition_interval = 1
        when 2
          self.repetition_interval = 6
        else
          self.repetition_interval = repetition_interval * easiness_factor
        end
      end
    end

    self.next_repetition = Date.today + repetition_interval
    self.last_studied = Date.today
  end

  def scheduled_to_recall?
    !next_repetition.nil? && next_repetition <= Date.today
  end

  private

  def calculate_easiness_factor(easiness_factor, quality_of_recall)
    q = quality_of_recall
    ef_old = easiness_factor

    result = ef_old - 0.8 + (0.28 * q) - (0.02 * q * q)
    result < 1.3 ? 1.3 : result
  end
end
