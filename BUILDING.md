Build Instructions
---

# Development Environment

There is a docker environment to help with keeping everything sandboxed.

```zsh
bin/docker <cmd> <params> <go> <here>
# E.g.
./bin/docker bundle install
./bin/docker bin/console #ruby interpreter

# Running rackup to test the app in standalone mode. The server settings are required so that you can curl it from outside the docker sandbox
bin/docker bundle exec rackup --server=puma --host=0.0.0.0 --port=22229
```


 Running the test suite

```zsh
bin/docker bundle exec rspec
```



