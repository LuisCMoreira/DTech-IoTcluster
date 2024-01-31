@echo off

REM Set the directory of the script
set SCRIPT_DIR=%~dp0

REM Define backup directory as a subfolder named "backups"
set BACKUP_DIR=%SCRIPT_DIR%backups

REM Restore ThingsBoard volume
docker run --rm ^
  -v %BACKUP_DIR%:/backup ^
  -v mytb-data:/data ^
  busybox tar xvf /backup/mytb-backup.tar -C /data

REM Restore Node-RED volume
docker run --rm ^
  -v %BACKUP_DIR%:/backup ^
  -v nodered-data:/data ^
  busybox tar xvf /backup/nodered-backup.tar -C /data

REM Restore MongoDB volume
docker run --rm ^
  -v %BACKUP_DIR%:/backup ^
  -v mongodb-data:/data/db ^
  busybox tar xvf /backup/mongodb-backup.tar -C /data/db
