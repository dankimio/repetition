# Repetition

Ruby implementation of the SuperMemo2 spaced-repetition algorithm. This gem allows you to easily incorporate the power of spaced repetition into your Ruby projects. The algorithm is based on the principles of increasing the interval between repetitions of learned material based on the user's performance, resulting in efficient and long-term retention of information. Simply add this gem to your project and start using the provided methods to incorporate spaced repetition into your application.

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
