#!/bin/bash

# FinSureTech Health Check Script
# Application: finsuretech
# Port: 3001

echo "Running health check for finsuretech..."

# Check if application is running
if curl -f http://localhost:3001/health > /dev/null 2>&1; then
    echo "✅ Application is healthy"
    exit 0
else
    echo "❌ Application health check failed"
    exit 1
fi 