variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the Key Vault."
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "tenant_id" {
  description = "The Azure tenant ID."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which the Key Vault should be accessible."
  type        = string
}

variable "vm_id" {
  description = "The ID of the virtual machine that should have access to the Key Vault."
  type        = string
}

variable "admin_password_secret_name" {
  description = "The name of the secret in the Key Vault to store the VM admin password."
  type        = string
}

variable "admin_password" {
  description = "The VM admin password."
  type        = string
}

variable "sql_admin_secret_name" {
  description = "The name of the secret in the Key Vault to store the SQL admin password."
  type        = string
}

variable "sql_admin_password" {
  description = "The SQL admin password."
  type        = string
}

variable "sql_connection_string" {
  description = "The SQL connection string."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}