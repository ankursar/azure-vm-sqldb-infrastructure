variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the resources."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}

variable "subnet_names" {
  description = "The names of the subnets within the virtual network."
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "The address prefixes for the subnets."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "vm_admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
}

variable "vm_admin_password" {
  description = "The admin password for the virtual machine."
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID of the Azure Active Directory."
  type        = string
}

variable "admin_password_secret_name" {
  description = "The name of the secret for the VM admin password."
  type        = string
}

variable "sql_admin_secret_name" {
  description = "The name of the secret for the SQL admin password."
  type        = string
}

variable "sql_connection_string" {
  description = "The SQL connection string."
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL Server."
  type        = string
}

variable "sql_database_name" {
  description = "The name of the SQL Database."
  type        = string
}

variable "sql_admin_username" {
  description = "The SQL admin username."
  type        = string
}

variable "sql_admin_password" {
  description = "The SQL admin password."
  type        = string
}

variable "workspace_name" {
  description = "The name of the Log Analytics workspace."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "The ID of the Log Analytics workspace."
  type        = string
}


