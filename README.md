[![Build Status](https://travis-ci.org/tcollier/distance.svg?branch=master)](https://travis-ci.org/tcollier/distance)

# Distance

Convenience methods for using distances

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'distance'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install distance

## Usage

There are multiple options for constructing a new `Distance` instance. The basic
constructor expects an `Float` argument that is the distannce is meters, e.g.

```ruby
eight_hundred_meters = Distance.meters(800)
```

If you are working with different units, you can construct a new instance with the
following convenience class methods

```ruby
ten_miles = Distance.miles(10)
five_km = Distance.kilometers(5)
```

Once you have a `Distance` instance, you can convert it to another base unit like

```ruby
ten_miles.to_kilometers
# => 16.09344
five_km.to_miles
# => 3.11
```

### Distance math

You can perform basic math with distances

```ruby
Distance.meters(1) + Distance.meters(2)
# => Distance.meters(3)
Distance.meters(3) - Distance.meters(1)
# => Distance.meters(2)
Distance.meters(3) * 2
# => Distance.meters(6)
Distance.meters(6) / 2
# => Distance.meters(3)
```

### Distance equality

You can also compare distances

```ruby
Distance.meters(10) > Distance.meters(9)
# => true
Distance.miles(10) <= Distance.kilometers(10)
# => false
```

### Numeric core extensions

You can optionally enable core extensions to `Float` and `Integer` by

```ruby
require 'distance/core_ext'
```

This adds the following convenience methods to `Float` and `Integer`

```ruby
26.2.miles
# => Distance.miles(26.2)
1.kilometer
# => Distance.kilometers(1)
5 * Distance.meters(100)
# => Distance.meters(500)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/distance. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
