#!/bin/bash

# FinSureTech Production Setup Script
# Application: finsuretech
# Base Path: ./local-infrastructure

echo "Setting up production environment for finsuretech..."

# Navigate to the base path
cd ./local-infrastructure

# Set production environment
export NODE_ENV=production

# Build production image
echo "Building production Docker image..."
docker build -t finsuretech:prod .

# Stop all containers
echo "Stopping all containers..."
docker-compose down

# Start production stack
echo "Starting production stack..."
docker-compose -f docker-compose.yml up -d

# Wait for services to be ready
echo "Waiting for services to be ready..."
sleep 20

# Run comprehensive health checks
echo "Running comprehensive health checks..."
./health-check.sh

# Check all services
echo "Checking all services..."
curl -f http://localhost:3001/health || echo "Application health check failed"
curl -f http://localhost:80/ || echo "Nginx health check failed"
curl -f http://localhost:9090/-/healthy || echo "Prometheus health check failed"

echo "✅ Production environment setup completed!"
echo "Application: http://localhost:3001"
echo "Nginx Proxy: http://localhost:80"
echo "Monitoring: http://localhost:9090 (Prometheus)"
echo "Dashboards: http://localhost:3000 (Grafana)" 