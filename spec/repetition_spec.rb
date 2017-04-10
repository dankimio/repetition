require 'spec_helper'

describe Repetition do
  before :each do
    class Test
      attr_accessor :easiness_factor, :number_repetitions, :quality_of_last_recall, :next_repetition, :repetition_interval, :last_studied

      include Repetition
    end
    @card = Test.new
    @card.reset_spaced_repetition_data
  end

  it 'has a version number' do
    expect(Repetition::VERSION).not_to be nil
  end

  it 'works when included' do
    @card.should respond_to :easiness_factor, :number_repetitions, :quality_of_last_recall, :next_repetition, :repetition_interval, :last_studied
  end

  it 'initializes values properly' do
    @card.easiness_factor.should == 2.5
    @card.number_repetitions.should == 0
    @card.quality_of_last_recall.should == nil
    @card.next_repetition.should == nil
    @card.repetition_interval.should == nil
    @card.last_studied.should == nil
  end

  it 'schedules for tommorow when interval = 0 and quality = 4' do
    @card.process_recall_result(4)

    @card.number_repetitions.should == 1
    @card.repetition_interval.should == 1
    @card.last_studied.should == Date.today
    @card.next_repetition.should == (Date.today + 1)
    @card.easiness_factor.should be_within(2.5).of(0.01)
  end

  it 'schedules for 6 days when interval = 1 and quality = 4' do
    @card.process_recall_result(4)
    @card.process_recall_result(4)

    @card.number_repetitions.should == 2
    @card.repetition_interval.should == 6
    @card.last_studied.should == Date.today
    @card.next_repetition.should == (Date.today + 6)
    @card.easiness_factor.should be_within(2.5).of(0.01)
  end

  it 'reports as scheduled for today' do
    @card.next_repetition = Date.today
    @card.scheduled_to_recall?.should == true

    @card.next_repetition = Date.today - 1
    @card.scheduled_to_recall?.should == true
  end

  it 'reports as not scheduled when next repetition is later than today' do
    @card.next_repetition = nil
    @card.scheduled_to_recall?.should == false

    @card.next_repetition = Date.today + 1
    @card.scheduled_to_recall?.should == false

    @card.next_repetition = Date.today + 99
    @card.scheduled_to_recall?.should == false
  end

  it 'requires repeating cards when quality == 3' do
    @card.process_recall_result(3)
    @card.next_repetition.should == Date.today

    @card.process_recall_result(3)
    @card.next_repetition.should == Date.today

    @card.process_recall_result(4)
    @card.next_repetition.should == Date.today + 1
  end
end
