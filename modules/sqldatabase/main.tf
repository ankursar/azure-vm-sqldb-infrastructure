resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
  tags                         = var.tags
}

resource "azurerm_sql_database" "sql_database" {
  name                = var.sql_database_name
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.sql_server.name
  sku_name            = "Standard"
  tags                = var.tags
}

resource "azurerm_private_endpoint" "sql_private_endpoint" {
  name                = "${var.sql_server_name}-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.sql_server_name}-psc"
    private_connection_resource_id = azurerm_sql_server.sql_server.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_sql" {
  name                       = "diag_sql"
  target_resource_id         = azurerm_sql_server.sql_server.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  log {
    category = "SQLInsights"
    enabled  = true
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}