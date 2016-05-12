# Ec2Switcher

Welcome to Ec2Switcher.
The purpose of this gem is to avoid you to pay for an AWS EC2 instance that you don't need running all the time.

Just use the gem when you want to switch off/on the instance.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ec2_switcher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ec2_switcher


## Configuration

**First Method**

Add as environment variables:

`AMAZON_REGION = 'your-region-1'`

`AMAZON_ACCESS_KEY = 'your-access-key'`

`AMAZON_SECRET_ACCESS = 'your-secret-access-key'`


**Second method**

If you have your credentials stored here `~/.aws/credentials`
create a profile called `ec2`

And prototype it like this ->
```
[ec2]
aws_access_key_id = youraccesskey
aws_secret_access_key = yoursecretaccesskey
```
**If your ec2 server is located somewhere else than `eu-west-1`, please fill up `AMAZON_REGION` variable**

## Usage

Make sure you have auto-scaling disabled on your ec2 instance.

Initialize a new switcher with your instance-id `switcher = Switcher.new('i-yourid')`

Then juste use `switcher.auto` to turn on your instance if it's down / off if it's up


### Pro-Tips

You can also use any ec2-instance command you want by using `switcher.ec2` variable.
Usable methods are here -> http://docs.aws.amazon.com/sdkforruby/api/Aws/EC2/Instance.html


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Kokiwi/ec2_switcher.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

