resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_names)
  name                 = element(var.subnet_names, count.index)
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [element(var.subnet_prefixes, count.index)]
  tags                 = var.tags
}

resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = "${var.vnet_name}-ddos"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_virtual_network" "vnet_with_ddos" {
  name                = azurerm_virtual_network.vnet.name
  address_space       = azurerm_virtual_network.vnet.address_space
  location            = azurerm_virtual_network.vnet.location
  resource_group_name = azurerm_virtual_network.vnet.resource_group_name
  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.ddos.id
    enable = true
  }
  tags = azurerm_virtual_network.vnet.tags
}

resource "azurerm_monitor_diagnostic_setting" "diag_vnet" {
  name                       = "diag_vnet"
  target_resource_id         = azurerm_virtual_network.vnet.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  log {
    category = "VirtualNetworkGatewayLog"
    enabled  = true
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}