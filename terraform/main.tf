# FinSureTech Local Infrastructure
# Terraform Configuration for Local Development Environment

terraform {
  required_version = ">= 1.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2"
    }
  }
}

# Generate unique project identifier
resource "random_id" "project" {
  byte_length = 8
}

# Local variables
locals {
  project_id = random_id.project.hex
  base_path  = var.base_path
  app_name   = var.app_name
  environment = var.environment
}

# Create project directory structure
resource "null_resource" "create_directories" {
  provisioner "local-exec" {
    command = "mkdir ${local.base_path}\\logs ${local.base_path}\\data ${local.base_path}\\certs ${local.base_path}\\backups 2>nul || echo Directories may already exist"
  }
}

# Create Docker Compose configuration
resource "local_file" "docker_compose" {
  content = templatefile("${path.module}/templates/docker-compose.yml.tftpl", {
    app_name = local.app_name
    port     = var.app_port
    nginx_port = var.nginx_port
    environment = local.environment
  })
  filename = "${local.base_path}/docker-compose.yml"
}

# Create environment configuration
resource "local_file" "env_file" {
  content = templatefile("${path.module}/templates/env.tftpl", {
    app_name = local.app_name
    port     = var.app_port
    environment = local.environment
    node_env = var.node_env
  })
  filename = "${local.base_path}/.env"
}

# Create Nginx configuration
resource "local_file" "nginx_conf" {
  content = templatefile("${path.module}/templates/nginx.conf.tftpl", {
    app_name = local.app_name
    port     = var.app_port
    nginx_port = var.nginx_port
  })
  filename = "${local.base_path}/nginx.conf"
}

# Create Prometheus configuration
resource "local_file" "prometheus_config" {
  content = templatefile("${path.module}/templates/prometheus.yml.tftpl", {
    app_name = local.app_name
    port     = var.app_port
  })
  filename = "${local.base_path}/prometheus.yml"
}

# Create Grafana configuration
resource "local_file" "grafana_config" {
  content = templatefile("${path.module}/templates/grafana.ini.tftpl", {
    app_name = local.app_name
  })
  filename = "${local.base_path}/grafana.ini"
}

# Create deployment script
resource "local_file" "deploy_script" {
  content = templatefile("${path.module}/templates/deploy.sh.tftpl", {
    app_name = local.app_name
    port     = var.app_port
  })
  filename = "${local.base_path}/deploy.sh"
}

# Create health check script
resource "local_file" "health_check" {
  content = templatefile("${path.module}/templates/health-check.sh.tftpl", {
    app_name = local.app_name
    port     = var.app_port
  })
  filename = "${local.base_path}/health-check.sh"
}

# Create backup script
resource "local_file" "backup_script" {
  content = templatefile("${path.module}/templates/backup.sh.tftpl", {
    app_name = local.app_name
    backup_path = var.backup_path
  })
  filename = "${local.base_path}/backup.sh"
}

# Create development setup script
resource "local_file" "dev_setup_script" {
  content = templatefile("${path.module}/templates/dev-setup.sh.tftpl", {
    app_name = local.app_name
    base_path = local.base_path
  })
  filename = "${local.base_path}/dev-setup.sh"
}

# Create production setup script
resource "local_file" "prod_setup_script" {
  content = templatefile("${path.module}/templates/prod-setup.sh.tftpl", {
    app_name = local.app_name
    base_path = local.base_path
  })
  filename = "${local.base_path}/prod-setup.sh"
}

# Create maintenance script
resource "local_file" "maintenance_script" {
  content = templatefile("${path.module}/templates/maintenance.sh.tftpl", {
    app_name = local.app_name
    base_path = local.base_path
  })
  filename = "${local.base_path}/maintenance.sh"
}

# Generate self-signed SSL certificate for local HTTPS
resource "null_resource" "generate_ssl_cert" {
  provisioner "local-exec" {
    command = <<-EOT
      openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout ${local.base_path}/certs/localhost.key \
        -out ${local.base_path}/certs/localhost.crt \
        -subj "/C=US/ST=Local/L=Local/O=${local.app_name}/CN=localhost"
    EOT
  }
  
  depends_on = [null_resource.create_directories]
} 