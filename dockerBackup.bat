@echo off
docker run -v mytb-data:/data -v %cd%\backup:/backup ubuntu tar czvf /backup/mytb-data-backup.tar.gz -C /data .

docker run -v nodered-data:/data -v %cd%\backup:/backup ubuntu tar czvf /backup/nodered-data-backup.tar.gz -C /data .


