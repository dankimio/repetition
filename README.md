# Repetition gem

Spaced repetition module which can be used as a mixin in Ruby apps. SuperMemo 2 is used as a repetition algorithm.

### Installation

Add to your Gemfile

```ruby
gem 'repetition'
```

or install from RubyGems

    $ gem install repetition

### Usage

```ruby
# Default values are provided
repetition = Repetition.new(easiness_factor: 2.5, interval: 0, repetitions: 0)
# Quality of recall: 0..5
# Returns: date of the next recall => <Date: 2018-08-09>
repetition.recall(4)
```

### Running Specs

`bundle exec rake`

### Contributing

Contributions are welcome! Feel free to post issues and create pull requests.
