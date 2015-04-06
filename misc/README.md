#Miscelaneous things to remember

## Backup and import Postgres database

Capture on NEW HEROKU CLI:
```
heroku pg:backups capture --app APP_NAME
curl -o latest2.dump `heroku pg:backups public-url b001 --app APP_NAME`
```

Capture on OLD HEROKU:
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



1. Stop heroku:
```
heroku maintenance:on
```

1. Backup
  ```
  heroku pgbackups:capture
  ```

2. Get the new changes:
  ```
  git push heroku master
  ```

3. Do all necessary migrations
  ```
  heroku run python manage.py migrate
  ```
  **NOTE: on older versions with south, you might need to add the app name at the end**

4. Turn on heroku again
  ```
  heroku maintenance:off
  ```

5. **Test it!!!**
