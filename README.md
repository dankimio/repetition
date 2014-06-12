# Repetition gem
Spaced repetition module which can be used as a mixin in Ruby apps. SuperMemo 2 is used as a repetition algorithm.

### Installation
Add to your Gemfile
    gem 'repetition'
or install from RubyGems
    gem install repetition

### Usage
Include module in your class or ActiveRecord model
```ruby
class Card < ActiveRecord::Base
  # some code
  include Repetition
end
```

This will add a bunch of properties to your model:
* easyness_factor
* number_repetitions
* quality_of_last_recall
* next_repetition
* repetition_interval
* last_studied

Make sure that appropriate fields are created in your database using migrations

You can now use all methods that are provided by gem, use 'process_recall_result(quality)' method to update next repetition date. Method takes one argument which should be integer in range from 0 to 5 (0 - again, 5 - perfect).
'''ruby
card = Card.first
card.next_repetition # => nil
card.process_recall_result(4)

card.repetition_interval # => 1
card.next_repetition # Tomorrow
'''

### Changelog
#### 1.0
* Initial version