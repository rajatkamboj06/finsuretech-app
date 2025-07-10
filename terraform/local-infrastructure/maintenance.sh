#!/bin/bash

# FinSureTech Maintenance Script
# Application: finsuretech
# Base Path: ./local-infrastructure

echo "Running maintenance tasks for finsuretech..."

# Navigate to the base path
cd ./local-infrastructure

# Clean up Docker resources
echo "Cleaning up Docker resources..."
docker system prune -f
docker volume prune -f

# Clean up logs
echo "Cleaning up old logs..."
find ./logs -name "*.log" -mtime +7 -delete

# Update base images
echo "Updating base images..."
docker pull nginx:alpine
docker pull prom/prometheus:latest
docker pull grafana/grafana:latest

# Restart services
echo "Restarting services..."
docker-compose restart

# Run health checks
echo "Running health checks after maintenance..."
./health-check.sh

echo "✅ Maintenance completed successfully!" 