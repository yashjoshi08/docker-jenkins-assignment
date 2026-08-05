#!/bin/bash

echo "===== Docker Containers ====="
docker ps

echo ""
echo "===== Nginx Logs ====="
docker logs nginx 2>&1 | tail -20

echo ""
echo "===== Unique IPs ====="

docker logs nginx 2>&1 \
| grep 'HTTP/' \
| awk '{print $1}' \
| sort -u