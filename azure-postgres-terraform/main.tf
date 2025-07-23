
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = var.postgresql_server_name
  resource_group_name    = azurerm_resource_group.rg.name
  location               = var.location
  administrator_login    = var.postgresql_admin_username
  administrator_password = var.postgresql_admin_password
  sku_name               = "B_Standard_B1ms"
  version                = var.postgresql_version
  storage_mb             = var.storage_mb
  backup_retention_days  = var.backup_retention_days
  zone                   = "1"

  authentication {
    password_auth_enabled = true
  }
}

resource "azurerm_postgresql_flexible_server_database" "pgdb" {
  name      = var.postgresql_database_name
  server_id = azurerm_postgresql_flexible_server.postgres.id
  collation = "C"
  charset   = "UTF8"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_all" {
  name             = "AllowAllIPs"
  server_id        = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}
