#!/bin/bash

PG_USER="schedule"
PG_HOST="localhost"
PG_DB="schedule"

DATE=$(date +"%Y%m%d%H%M%S")

DUMP_PATH="/root/dumpfiles"

MAX_BACKUPS=5

pg_dump -U "$PG_USER" -h "$PG_HOST" -d "$PG_DB" > "$DUMP_PATH/backup_$DATE.sql"

NUM_BACKUPS=$(ls -l "$DUMP_PATH" | grep ^- | wc -l)

if [ $NUM_BACKUPS -gt $MAX_BACKUPS ]; then
  OLD_BACKUPS=$(ls -t "$DUMP_PATH" | tail -n $(($NUM_BACKUPS - $MAX_BACKUPS)))
  for file in $OLD_BACKUPS; do
    rm "$DUMP_PATH/$file"
  done
fi