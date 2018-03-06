#!/bin/bash

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "0 5 * * * /home/hf/s3bucketreport/s3tklog.sh" >> mycron
#install new cron file
crontab mycron
rm mycron
