variable "name" {
  default     = ""
  type        = string
  description = "Prefix of the resource name."
}

variable "location" {
  default     = "eastus"
  type        = string
  description = "Location of the resource."
}

variable "environment" {
  description = "Enviornment tag of the pg server"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "Specify the name of the resource group to be created"
  type        = string
  default     = "pg-flexible"
}

variable "resource_group_location" {
  description = "Specify the region of the resource group to be created"
  type        = string
  default     = ""
}

variable "create_vnet" {
  description = "Set to true to create a fresh vnet for the database server."
  type        = bool
  default     = true
}

variable "vnet_name" {
  description = "If vnet creation is set to false, specify the vnet name here."
  type        = string
  default     = ""
}

variable "vnet_id" {
  description = "If vnet creation is set to false, specify the vnet id here."
  type        = string
  default     = ""
}

variable "vnet_address_space" {
  description = "Vnet will be created with specified CIDR's."
  type        = string
  default     = ""
}

variable "subnet_cidr" {
  description = "New subnet will be created with 'Microsoft.Storage' service endpoint."
  type        = string
  default     = ""
}

variable "administrator_username" {
  description = "Username for the database server administrator"
  type        = string
  default     = "admin"
}

variable "administrator_password" {
  description = "Password for the database server administrator"
  type        = string
  default     = "Password@123"
}

variable "pg_version" {
  description = "Version of PostgreSQL to be installed on the server"
  type        = string
  default     = "12"
}

variable "zones" {
  description = "Number of availability zones for the database server"
  type        = string
  default     = "1"
}

variable "storage_mb" {
  description = "Storage size in MB for the database server"
  type        = string
  default     = "131072"
}

variable "sku_name" {
  description = "Name of the SKU for the database server"
  type        = string
  default     = "GP_Standard_D2s_v3"
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = string
  default     = "7"
}

variable "db_collation" {
  description = "Collation for the database server"
  type        = string
  default     = "en_US.UTF8"
}

variable "db_charset" {
  description = "Character set for the database server"
  type        = string
  default     = "UTF8"
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    tag1 = ""
    tag2 = ""
  }
}

variable "vnet_resource_group_name" {
  description = "The resource group name of the vnet where it is present"
  type        = string
  default     = ""
}

variable "maintenance_window" {
  description = "Map of maintenance window configuration."
  type        = map(number)
  default     = null
}

variable "start_ip_address" {
  description = "Start ip address of the firewall rules."
  type        = string
  default     = ""
}

variable "end_ip_address" {
  description = "End IP address of the firewall rules."
  type        = string
  default     = ""
}

variable "diagnostic_setting_enabled" {
  description = "Enable the diagnostic setting."
  type        = bool
  default     = false
}