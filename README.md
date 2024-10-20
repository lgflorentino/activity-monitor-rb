# Activity Monitor for Ruby
![Test Status](https://github.com/lgflorentino/activity_monitor_rb/actions/workflows/tests.yml/badge.svg)

This is a [Rack](https://github.com/rack/rack) Middleware app. It is heavily influenced by the [Hanami](https://hanamirb.org) web framework and [dry-rb](https://dry-rb.org/) libraries. 
The app will accept [json](https://ecma-international.org/publications-and-standards/standards/ecma-404/) data posted to it from webhooks commonly used on version control systems (VCS).

There is no documentation given about setting up webhooks on any of the VCS platforms. Most VCS systems and vendors will have extensive doco for you to peruse on that topic.

Features:

* Supported Webhook Events
    * Feature location: `lib/activity_monitor/json_parser/{all,subset}`
    - [x] Push 
    - [ ] Pull Request event implemented
    - [ ] Issue Created event implemented
    - [ ] Comment event implemented
* JSON payload parsing
    * Feature location: `lib/activity_monitor/json_parser`
    - [ ] implemented
* Provide webhook event support for the following third party services
    * Feature location: `lib/activity_monitor/services/`
    - [x] Github
    - [x] Gitlab
    - [x] Bitbucket
    - [x] Codeberg
    - [ ] Source Hut (No webhooks yet)
    - [ ] Custom git deployment 
* API access for the following third party services (very low priority)
    * Feature location `lib/activity_monitor/services/api-clients`
    - [ ] Github
    - [ ] Gitlab
    - [ ] Bitbucket
    - [ ] Codeberg
    - [ ] Source Hut (No webhooks yet)
    - [ ] Custom git deployment 
* Create and maintain a list of URL endpoints which will receive JSON from externally configured webhooks
    * Feature location: `lib/activity_monitor/routing && config/config.rb`
    - [x] implemented
    - [x] configurable
* Provide webhook verification for each service
    * Feature location: ``
* Persistance features
    * Feature location: `lib/activity_monitor/db`
    - [x] Configures [rom-rb](https://github.com/rom-rb) to connect to db
        - [x] supports the SQL adapter type from [rom-rb](https://rom-rb.org/learn/introduction/glossary/) 
        - [x] Only a single connection is supported

Anti-features:
* No display or analysis of the data of any kind (see [hheatmap](https://github.com/lgflorentino/hheatmap) for reference front-end) or write your own web app to grab the data from the db

## Standalone Usage Instructions

Install the gem as a dependency through the usual bundle commands
```sh
    $> bundle add activity_monitor
```

## Hanami Plugin Usage Instructions [TODO]
```sh
$ bundle exec hanami activity-monitor install
```

## Environment & 3rd party API access.
**Not implemented yet**
*This feature can be implemented externally to this app. Simply find the appropriate diff/compare link for the event from the db and call it using whatever api or http client you want.* 

`ENABLE_API_ACCESS` defaults to `false`

If the environment variable `ENABLE_API_ACCESS` is set to true the app will make requests to the 3rd party APIs which have been configured. This exposes the account under which the app is acting to be susceptible to rate limiting and other administration restrictions from the 3rd party. 

Enabling API access will enable the app to retrieve the details about an event which will be much more deep than the data sent in the intial webhook event payload.

If set to `ENABLE_API_ACCESS=true` please set the appropriate environment variables. The app will use these variables to authenticate itself with the API. The list of variables which need to be set are in the `.env.development` file with pre-filled dummy data. 

## CLI

The app comes a Command Line Interface (CLI) tool to help with some tasks. The documentation for the tool is provided by the tool when used in conjunction with the `--help` option.
Ex:
```sh
  # List available rake tasks
  bundle exec rake [--tasks|-T]

  # Bundled activity monitor tool
  bundle exec am --help
  
  # bundle exec am COMMAND --help
  bundle exec am run --help
  
  # connect to the db to run some command 
  DATABASE_URL="sqlite://./.data/am.db" bundle exec rake db:clean
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
