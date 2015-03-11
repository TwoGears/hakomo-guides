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

## DEPLOYMENT HEROKU

###Before you start with heroku make sure that you:

1. create migration files and migrate locally
2. if you installed anything with pip, run `pip freeze > requirements.txt` in the correct folder

### On Heroku

Stop heroku:
```
heroku maintenance:on
```

Get the new changes:
```
git push heroku master
```

Do all necessary migrations
```
heroku run python manage.py migrate
```
NOTE: on older versions with south, you might need to add the app name at the end

Turn on heroku again
```
heroku maintenance:off
```

*Test it!!!*
