#Miscelaneous things to remember

## Backup and import Postgres database

Capture:

```
heroku pgbackups:capture
curl -o latest.dump `heroku pgbackups:url`
```
Import:

```
pg_restore --verbose --clean --no-acl --no-owner -j 2 -h localhost -U pp -d eltrackero latest.dump
```