#!/bin/bash

# FinSureTech Backup Script
# Application: finsuretech
# Backup Path: ./backups

echo "Starting backup for finsuretech..."

# Create backup directory if it doesn't exist
mkdir -p ./backups

# Create backup of application data
BACKUP_FILE="./backups/finsuretech_backup_$(date +"%Y%m%d_%H%M%S").tar.gz"
echo "Creating backup: $BACKUP_FILE"
tar -czf "$BACKUP_FILE" \
    --exclude='node_modules' \
    --exclude='.git' \
    --exclude='*.log' \
    .

echo "✅ Backup completed: $BACKUP_FILE"

# Clean up old backups (keep last 7 days)
find ./backups -name "finsuretech_backup_*.tar.gz" -mtime +7 -delete

echo "✅ Old backups cleaned up" 