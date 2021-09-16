cd pg_backup/db_backups

BACKUP_FOLDER="k8s-backup-`date +%Y-%m-%d-%H-%M`"
echo "Creating dump: $BACKUP_FOLDER"

# https://www.postgresql.org/docs/9.6/app-pgdump.html
pg_dump --create --no-password --no-owner --format=directory -f $BACKUP_FOLDER --exclude-table-data=django_session

if [ $? -ne 0 ]; then
  rm -rf $BACKUP_FOLDER
  echo "Back up not created, check db connection settings"
  exit 1
fi

echo "Successfully backed up"
exit 0
