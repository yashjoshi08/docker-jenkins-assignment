#!/bin/bash

echo "===== Docker Containers ====="
docker ps

echo ""
echo "===== Nginx Logs ====="
docker logs nginx 2>&1 | tail -20

echo ""
echo "===== Unique IPs ====="

docker logs nginx 2>&1 | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -u