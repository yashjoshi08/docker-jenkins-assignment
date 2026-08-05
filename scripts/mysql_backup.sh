#!/bin/bash

echo "======================================"
echo "Creating MySQL Backup..."
echo "======================================"

mkdir -p backups

docker exec mysql mysqldump -uroot -proot123 devopsdb > backups/devopsdb.sql

echo "======================================"
echo "Uploading Backup to S3..."
echo "======================================"

aws s3 cp backups/devopsdb.sql s3://yash-docker-jenkins-backup/

echo "======================================"
echo "Backup Uploaded Successfully!"
echo "======================================"
