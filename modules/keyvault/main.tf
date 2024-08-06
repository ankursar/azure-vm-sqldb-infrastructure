resource "azurerm_key_vault" "kv" {
  name                     = var.key_vault_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  tenant_id                = var.tenant_id
  sku_name                 = "standard"
  purge_protection_enabled = true
  soft_delete_enabled      = true
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = [var.subnet_id]
  }
  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "vm_access" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = var.tenant_id
  object_id    = var.vm_id

  secret_permissions = [
    "get",
    "list"
  ]
}

resource "azurerm_key_vault_secret" "vm_admin_password" {
  name         = var.admin_password_secret_name
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.sql_admin_secret_name
  value        = var.sql_admin_password
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "sql_connection_string" {
  name         = "SqlConnectionString"
  value        = var.sql_connection_string
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_monitor_diagnostic_setting" "diag_kv" {
  name                       = "diag_kv"
  target_resource_id         = azurerm_key_vault.kv.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  log {
    category = "AuditEvent"
    enabled  = true
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}