#!/bin/bash
set -e

cp /tmp/Dockerfile.app /workspace/Dockerfile
cp /tmp/docker-compose.app.yml /workspace/docker-compose.yml

exec "$@"