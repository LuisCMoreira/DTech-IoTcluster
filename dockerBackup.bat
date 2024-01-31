@echo off

REM Set the directory of the script
set SCRIPT_DIR=%~dp0

REM Define backup directory as a subfolder named "backups"
set BACKUP_DIR=%SCRIPT_DIR%backups

REM Create the backups directory if it doesn't exist
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

REM Back up ThingsBoard volume
docker run --rm ^
  -v %BACKUP_DIR%:/backup ^
  -v mytb-data:/data ^
  busybox tar cvf /backup/mytb-backup.tar /data

REM Back up Node-RED volume
docker run --rm ^
  -v %BACKUP_DIR%:/backup ^
  -v nodered-data:/data ^
  busybox tar cvf /backup/nodered-backup.tar /data

REM Back up MongoDB volume
docker run --rm ^
  -v %BACKUP_DIR%:/backup ^
  -v mongodb-data:/data/db ^
  busybox tar cvf /backup/mongodb-backup.tar /data/db
