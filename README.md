# Activity Monitor for Ruby
![Test Status](https://github.com/lgflorentino/activity_monitor_rb/actions/workflows/tests.yml/badge.svg)

This is a [Hanami](https://hanamirb.org) [provider](https://guides.hanamirb.org/v2.2/app/providers/). It's function is to receive notifications from webhooks commonly used on version control systems (VCS).

There is no documentation given about setting up webhooks on any of the VCS platforms. Most VCS will have extensive doco for you to peruse.

Features:

* Create and maintain a list of URL endpoints which will receive JSON from externally configured webhooks
    * Feature location: `lib/activity_monitor/router`
    - [ ] Feature implemented
* Parse JSON that is received on the webhook endpoints
    * Feature location: `lib/activity_monitor/json_parser`
    - [ ] Feature implemented
* Provide parsing for a webhook which posts all data or a subset of data
    * Feature location `lib/activity_monitor/json_parser/{all,subset}`
    - [ ] Feature implemented
* Store parsed data in db or other
    * Feature location: `lib/activity_monitor/persistance`
    - [ ] Feature implemented
* Provide URL endpoints for the following third party services
    - [ ] Github
    - [ ] Gitlab
    - [ ] Bitbucket
    - [ ] Codeberg
    - [ ] Source Hut (No webhooks yet)
    - [ ] Custom git deployment

Anti-features:
* No display or analysis of the data of any kind (see [hheatmap](https://github.com/lgflorentino/hheatmap) for reference front-end) or write your own web app to grab the data from the db

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add activity_monitor

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install activity_monitor

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
