
variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-postgres-flex"
}

variable "postgresql_server_name" {
  description = "Unique name of the PostgreSQL flexible server"
  type        = string
  default     = "pg-flex-demo"
}

variable "postgresql_admin_username" {
  description = "Admin username for PostgreSQL"
  type        = string
  default     = "pgadmin"
}

variable "postgresql_admin_password" {
  description = "Admin password for PostgreSQL"
  type        = string
  sensitive   = true
  default     = "StrongPassword123!"
}

variable "postgresql_version" {
  description = "PostgreSQL engine version"
  type        = string
  default     = "14"
}

variable "storage_mb" {
  description = "Storage size in MB"
  type        = number
  default     = 32768
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "postgresql_database_name" {
  description = "Name of the PostgreSQL database"
  type        = string
  default     = "myappdb"
}

variable "start_ip_address" {
  description = "Start IP address for firewall rule"
  type        = string
  default     = "0.0.0.0"
}

variable "end_ip_address" {
  description = "End IP address for firewall rule"
  type        = string
  default     = "255.255.255.255"
}
