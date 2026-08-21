#!/bin/sh
set -e

mkdir -p /app/persist/credentials /app/persist/instances /app/persist/logs /app/persist/maps

rm -rf /app/dist/credentials /app/dist/instances /app/dist/logs /app/dist/maps

ln -s /app/persist/credentials /app/dist/credentials
ln -s /app/persist/instances /app/dist/instances
ln -s /app/persist/logs /app/dist/logs
ln -s /app/persist/maps /app/dist/maps

exec node dist/index.js