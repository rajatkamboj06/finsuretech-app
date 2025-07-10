# FinSureTech Local Infrastructure Variables

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "finsuretech"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "base_path" {
  description = "Base path where all local files will be created"
  type        = string
  default     = "./local-infrastructure"
}

variable "app_port" {
  description = "Port for the main application"
  type        = number
  default     = 3001
}

variable "nginx_port" {
  description = "Port for nginx reverse proxy"
  type        = number
  default     = 80
}

variable "node_env" {
  description = "Node.js environment"
  type        = string
  default     = "development"
}

variable "backup_path" {
  description = "Path for backup files"
  type        = string
  default     = "./backups"
} 