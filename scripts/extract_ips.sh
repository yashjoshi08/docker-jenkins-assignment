#!/bin/bash

echo "======================================"
echo "Unique IP Addresses from Nginx Logs"
echo "======================================"

docker logs nginx 2>&1 \
| awk '{print $1}' \
| grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$' \
| sort -u
