# Jekyll::Anticache::Tag

A simple Jekyll tag for cache busting.

add unixtime query string for assets every build

## Usecase

```
{% acasset foo.png %}
# => foo.png?1624352400
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-anticache-tag'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-anticache-tag

## Usage

add line as below in `plugins:` key of `_config.yml `

```yaml
  - jekyll-anticache-tag
```

### replace tag_name

If you want to write just `asset` in order to use this, add as below in `_config.yaml`

```yaml
anticache_tag:
  tag: 'asset'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/colorfulcompany/jekyll-anticache-tag.
