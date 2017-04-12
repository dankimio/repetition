# Repetition gem
Spaced repetition module which can be used as a mixin in Ruby apps. SuperMemo 2 is used as a repetition algorithm.

### Installation
Add to your Gemfile

    gem 'repetition'

or install from RubyGems

    gem install repetition


### Rails

Create a migration to add the new fields to your model.
```ruby
change_table :cards do |t|
  t.decimal :easiness_factor, precision: 2, scale: 1, default: 2.5, null: false
  t.integer :number_repetitions, default: 0, null: false
  t.integer :quality_of_last_recall
  t.date :next_repetition
  t.integer :repetition_interval
  t.date :last_studied
end
```

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

You can now use all methods that are provided by gem, use `process_recall_result(quality)` method to update next repetition date. Method takes one argument which should be integer in range from 0 to 5 (0 - again, 5 - perfect).
```ruby
card = Card.first
card.next_repetition # => nil
card.process_recall_result(4)

card.repetition_interval # => 1
card.next_repetition # Tomorrow
card.save # Don't forget to save your card!
```

### Changelog
#### 1.0
* Initial version

### Running Specs

`bundle exec rake`

### Contributing
Contributions are welcome! Feel free to post issues and create pull requests.

