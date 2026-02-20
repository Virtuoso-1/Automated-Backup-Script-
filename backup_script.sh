
#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# ... rest of your script ...


# Directories 
SOURCE_DIR="/home/olamide/bash-project"
BACKUP_DIR="/home/olamide/backups"


DATE=$(date +%Y-%m-%d-%H-%M-%S) 

# Create the backup directory incase it doess not exist 
mkdir -p $BACKUP_DIR

echo "Starting backup of $SOURCE_DIR ..."

tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" "$SOURCE_DIR"


if [ $? -eq 0 ]; then
	echo "SUCCESS: Backup created at $BACKUP_DIR/backup_$DATE.tar.gz"
else 
	echo "ERROR: Backup failed!"
fi






