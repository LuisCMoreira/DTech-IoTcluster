
@echo off

REM docker run -v mytb-data:/data -v %cd%\backup:/backup ubuntu tar xzvf /backup/mytb-data-backup.tar.gz -C /data
docker volume create mytb-data


docker volume create mytb-logs

REM docker run -v nodered-data:/data -v %cd%\backup:/backup ubuntu tar xzvf /backup/nodered-data-backup.tar.gz -C /data
docker volume create nodered-data

docker volume create mongodb-data

REM docker rmi ubuntu