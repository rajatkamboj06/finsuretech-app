#!/bin/bash

# FinSureTech Local Deployment Script
# Application: finsuretech
# Port: 3001

echo "Starting deployment for finsuretech..."

# Build the Docker image
echo "Building Docker image..."
docker build -t finsuretech:latest .

# Stop existing containers
echo "Stopping existing containers..."
docker-compose down

# Start the application stack
echo "Starting application stack..."
docker-compose up -d

# Wait for application to be ready
echo "Waiting for application to be ready..."
sleep 10

# Health check
echo "Running health check..."
curl -f http://localhost:3001/health || echo "Health check failed"

echo "Deployment completed!"
echo "Application available at: http://localhost:3001"
echo "Nginx proxy available at: http://localhost:80" 