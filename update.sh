#!/bin/sh

# Build
docker build . --squash -t mytardis/k8s-db-backup:latest

# Push
docker push mytardis/k8s-db-backup:latest
