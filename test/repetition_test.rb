require 'test_helper'

class RepetitionTest < Minitest::Test
  def setup
    @card = Repetition::Flashcard.new
  end

  def test_test_that_it_has_a_version_number
    refute_nil ::Repetition::VERSION
  end

  def test_works_when_initialized
    assert_respond_to @card, :easiness_factor
    assert_respond_to @card, :interval
    assert_respond_to @card, :repetitions
    assert_respond_to @card, :due_on
    assert_respond_to @card, :recall
  end

  def test_quality_is_validated
    assert_raises ArgumentError do
      @card.recall(6)
    end
  end

  def test_schedules_for_tommorow_when_interval_4_and_quality_4
    @card.recall(4)

    assert_equal 1, @card.repetitions
    assert_equal 1, @card.interval
    assert_equal Date.today + 1, @card.due_on
  end

  def test_schedules_for_6_days_when_interval_1_and_quality_4
    @card.recall(4)
    @card.recall(4)

    assert_equal 2, @card.repetitions
    assert_equal 6, @card.interval
    assert_equal Date.today + 6, @card.due_on
  end

  def test_requires_repeating_cards_when_quality_3
    @card.recall(3)
    assert_equal Date.today, @card.due_on

    @card.recall(3)
    assert_equal Date.today, @card.due_on

    @card.recall(4)
    assert_equal Date.today + 1, @card.due_on
  end
end
