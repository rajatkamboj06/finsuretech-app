# FinSureTech Local Infrastructure Outputs

output "project_id" {
  description = "Unique project identifier"
  value       = random_id.project.hex
}

output "base_path" {
  description = "Base path where all local files are created"
  value       = var.base_path
}

output "app_name" {
  description = "Application name"
  value       = var.app_name
}

output "environment" {
  description = "Environment name"
  value       = var.environment
}

output "app_port" {
  description = "Application port"
  value       = var.app_port
}

output "nginx_port" {
  description = "Nginx reverse proxy port"
  value       = var.nginx_port
}

output "local_urls" {
  description = "Local application URLs"
  value = {
    application = "http://localhost:${var.app_port}"
    nginx       = "http://localhost:${var.nginx_port}"
    prometheus  = "http://localhost:9090"
    grafana     = "http://localhost:3000"
  }
}

output "setup_instructions" {
  description = "Instructions for setting up the local environment"
  value = <<-EOT
    Local Infrastructure Setup Complete!
    
    Next Steps:
    1. Navigate to the generated directory: cd ${var.base_path}
    2. Start the application stack: docker-compose up -d
    3. Access the application: http://localhost:${var.app_port}
    4. Access Nginx reverse proxy: http://localhost:${var.nginx_port}
    5. Access Prometheus monitoring: http://localhost:9090
    6. Access Grafana dashboards: http://localhost:3000
    
    Generated Scripts:
    - Run health check: ./health-check.sh
    - Deploy application: ./deploy.sh
    - Create backup: ./backup.sh
    - Development setup: ./dev-setup.sh
    - Production setup: ./prod-setup.sh
    - Maintenance: ./maintenance.sh
    
    Project ID: ${random_id.project.hex}
    Environment: ${var.environment}
    Application: ${var.app_name}
  EOT
}

output "infrastructure_summary" {
  description = "Summary of the local infrastructure"
  value = {
    project_id    = random_id.project.hex
    app_name      = var.app_name
    environment   = var.environment
    base_path     = var.base_path
    app_port      = var.app_port
    nginx_port    = var.nginx_port
    backup_path   = var.backup_path
  }
} 