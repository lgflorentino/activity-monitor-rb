Build Instructions
---

# Development Environment

There is a docker environment to help with keeping everything sandboxed.

```zsh
./script/docker_dev_wrap.sh <cmd> <params> <go> <here>
# E.g.
./script/docker_dev_wrap.sh bundle install

```

# Running the test suite

```zsh
/script/docker_dev_wrap.sh bundle rspec
```



