# Title: Automated-Backup-Script

# 1. Project Overview 
The Automated-Backup-Script is a Bash-based solution that performs automated server backup.  

The script:
- Backs up a specified directory
- Adds timestamps to the backup files
- Compresses the backup files 
- Stores the backup files in designated loaction


# 2. Problem Statement 
Business continuity Plan is essential for every organization. Backing up files and data is one of the essential aspects of Business Continuity Plan. Failure to implement automated backups may results in:

- Loss of revenues during disasters
- Permanent loss of company and customers data
- Reputation damage

# 3. Solution Approach 
This script automates regular backups using standard Linux utilities:
- `mkdir` to create new directory
- `tar -czf` to create and compress archive file
- `if` statement to trigger alerts
- `date` to generate timestamp

# 4. Script Breakdown
`#!/bin/bash` <--- # This tells the Linux kernel to use Bash intepreter to execute the script.

`PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin` <---- This is an environment variable assignment that tells Bash where to look for executable commands. 

#### A. Create directories using variable
```
# Directories 
SOURCE_DIR="/home/olamide/bash-project"
BACKUP_DIR="/home/olamide/backups"
```
Used variables to represent my directories. This makes modifying paths easy. 

#### B. Create Timestamp variable
```
DATE=$(date +%Y-%m-%d-%H-%M-%S) 
```
This generates a timestamp in the format: `YYYY-MM-DD-HH-MM-SS` to make sure each backup file is unique. 

#### C. Create directory and backup files. 
```
mkdir -p $BACKUP_DIR

echo "Starting backup of $SOURCE_DIR ..."

tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" "$SOURCE_DIR"
```

- `mkdir -p $BACKUP_DIR` creates the backup directory incase it does not already exist. 

- `tar -czf`
    - `-c` --> Create archives
    - `-z` --> Compress with gzip
    - `-f` --> Specify filename
    
`/backup_$DATE.tar.gz` helps to create a backup file with a timestamp on it using the `$DATE` variable. 

The resulting file format:
```
backup_2026-02-20-10-49-04.tar.gz
```
#### D. Exit Status Check
```
if [ $? -eq 0 ]; then
        echo "SUCCESS: Backup created at $BACKUP_DIR/backup_$DATE.tar.gz"
else 
        echo "ERROR: Backup failed!"
fi
```

- `$?` is a special variable that stores the exit status of the last command in the script.
    - `0` = success
    - `Non-zero`= failure
This ensures feedback. 

- The `if` statement helps check the exit status, then print the corresponding output to the screen. 

# 5. How to Run
- Grant the script executable permission --> `chmod +x backup_script.sh`
- Run the script --> `./backup-script.sh`

# 6. Automation with Cron 
Running backup manually is burdensome and error prone, so we automate this process by making use of the crontab. 

```
15 13 * * * /home/olamide/bash-project/backup_script.sh >> /home/olamide/bash-project/backup.log 2>&1
```
The cron tasks backs up the server every 1:15pm everyday. It then append either the success or failure output to a log file. 

# 7. Future Improvements
- Add more paths for the script to backup.
- Send alerts whenever a backup is not successful
- Add retention policy 
















