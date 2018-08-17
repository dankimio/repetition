# Repetition

[![Build Status](https://img.shields.io/travis/dankimio/repetition.svg?style=flat)](https://travis-ci.org/dankimio/repetition)
[![Gem Version](https://img.shields.io/gem/v/repetition.svg?style=flat&color=brightgreen)](https://rubygems.org/gems/repetition)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://raw.githubusercontent.com/dankimio/repetition/master/LICENSE.TXT)

Spaced repetition algorithm for scheduling flashcard repetitions. SuperMemo 2 is used as a repetition algorithm.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'repetition'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install repetition

## Usage

```ruby
# Default values are provided
repetition = Repetition::Flashcard.new(easiness_factor: 2.5, interval: 0, repetitions: 0)
# Quality of recall: 0..5
# Returns: date of the next recall => <Date: 2018-08-09>
repetition.recall(4)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dankimio/repetition.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
