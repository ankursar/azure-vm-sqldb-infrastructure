# All data related terraform resources should be in this file

##############################################
################## Example ###################
##############################################
#
# data "azurerm_virtual_network" "vnet" {
#   name                = var.vnet_name
#   resource_group_name = var.vnet_rg
# }

# data "azurerm_network_security_group" "nsg" {
#   name                = var.nsg_name
#   resource_group_name = var.vnet_rg
# }