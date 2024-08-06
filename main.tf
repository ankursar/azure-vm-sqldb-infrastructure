module "network" {
  source                     = "./modules/network"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  vnet_name                  = var.vnet_name
  address_space              = var.vnet_address_space
  subnet_names               = var.subnet_names
  subnet_prefixes            = var.subnet_prefixes
  log_analytics_workspace_id = module.loganalytics.workspace_id
  tags                       = var.tags
}

module "vm" {
  source                     = "./modules/vm"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  vnet_name                  = module.network.vnet_name
  subnet_name                = element(module.network.subnet_names, 0)
  vm_name                    = var.vm_name
  admin_username             = var.vm_admin_username
  admin_password             = var.vm_admin_password
  log_analytics_workspace_id = module.loganalytics.workspace_id
  tags                       = var.tags
}

module "keyvault" {
  source                     = "./modules/keyvault"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  key_vault_name             = var.key_vault_name
  tenant_id                  = var.tenant_id
  subnet_id                  = element(module.network.subnet_ids, 1)
  vm_id                      = module.vm.vm_id
  admin_password_secret_name = var.admin_password_secret_name
  admin_password             = var.vm_admin_password
  sql_admin_secret_name      = var.sql_admin_secret_name
  sql_admin_password         = var.sql_admin_password
  log_analytics_workspace_id = module.loganalytics.workspace_id
  sql_connection_string      = module.sqldatabase.sql_connection_string
  tags                       = var.tags
}

module "sqldatabase" {
  source                     = "./modules/sqldatabase"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  sql_server_name            = var.sql_server_name
  sql_database_name          = var.sql_database_name
  sql_admin_username         = var.sql_admin_username
  sql_admin_password         = var.sql_admin_password
  vnet_name                  = module.network.vnet_name
  subnet_id                  = element(module.network.subnet_ids, 1)
  log_analytics_workspace_id = module.loganalytics.workspace_id
  tags                       = var.tags
}

module "loganalytics" {
  name                         = var.log_analytics_workspace_name
  source                       = "./modules/loganalytics"
  log_analytics_workspace_name = var.log_analytics_workspace_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  tags                         = var.tags
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "vm_id" {
  value = module.vm.vm_id
}

output "key_vault_id" {
  value = module.keyvault.key_vault_id
}

output "sql_database_id" {
  value = module.sqldatabase.sql_database_id
}

output "log_analytics_workspace_id" {
  value = module.loganalytics.workspace_id
}