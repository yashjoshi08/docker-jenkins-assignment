#!/bin/bash

set -e

echo "======================================"
echo "Creating MySQL Backup..."
echo "======================================"

mkdir -p backups

docker exec mysql mysqldump -uroot -proot123 devopsdb > backups/devopsdb.sql

echo "MySQL backup created successfully"

echo "======================================"
echo "Uploading Backup to S3..."
echo "======================================"

aws s3 cp backups/devopsdb.sql s3://yash-ec2-jenkins-backup-2026/devopsdb.sql

echo "======================================"
echo "Backup Uploaded Successfully!"
echo "======================================"
