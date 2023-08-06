resource "azurerm_mysql_server" "mysql" {
  name                = var.db_server_name
  location            = var.location
  resource_group_name = var.rgname

  administrator_login          = var.username
  administrator_login_password = var.password

  sku_name   = "B_Gen5_2"
  storage_mb = var.db_size
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"

  tags = {
    Owner       = var.owner,
    Environment = var.Environment
  }
}

resource "azurerm_mysql_database" "mysql" {
  name                = var.db_name
  resource_group_name = var.rgname
  server_name         = var.db_server_name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

