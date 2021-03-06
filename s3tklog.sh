#!/bin/sh

date=$(date +%Y-%m-%d_%H:%M)

echo "Running S3 Bucket Check for " $date

/usr/local/bin/s3tk scan > /home/hf/s3bucketreport/log.$date.log

echo "Waiting for Report to Generate"

while [ ! -f /home/hf/s3bucketreport/log.$date.log ]
do
  sleep 2
done

echo "Sending Email"

cat /home/hf/s3bucketreport/log.$date.log | mail -s "Daily S3 Bucket Security Report" -a "From: HyperGrid Reporting <noreply@HyperGrid.com>" jmasci@hypergrid.com
