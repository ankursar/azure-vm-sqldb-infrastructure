variable "resource_group_name" {
  description = "The name of the resource group in which to create the SQL Database."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the SQL Database."
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

variable "subnet_id" {
  description = "The ID of the subnet where the private endpoint will be deployed."
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