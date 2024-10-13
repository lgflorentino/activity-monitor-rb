Notes
---


# Development Commands

To run the bundle commands in an isolated docker container
```zsh
./bin/docker <cmd> <params> <go> <here>
# E.g.
./bin/docker bundle install

```

# SQLite3 CLI Commands

# To insert some data using the test sqlite3 db
```sh
$ sqlite3 ./.data/am.db

sqlite> INSERT INTO services (name, url, created_at, updated_at) VALUES ('bitbucket', 'https://bitbucket.org', datetime(), datetime());
```

# Webhook payload structures
## Bitbucket
[https://support.atlassian.com/bitbucket-cloud/docs/event-payloads/](https://support.atlassian.com/bitbucket-cloud/docs/event-payloads/)
## Codeberg
[https://forgejo.org/docs/latest/user/webhooks/](https://forgejo.org/docs/latest/user/webhooks/)
## Github
[https://docs.github.com/en/webhooks/webhook-events-and-payloads](https://docs.github.com/en/webhooks/webhook-events-and-payloads)
## Gitlab
[https://docs.gitlab.com/ee/user/project/integrations/webhook_events.html#push-events](https://docs.gitlab.com/ee/user/project/integrations/webhook_events.html#push-events)
