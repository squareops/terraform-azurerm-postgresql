locals {
  region      = "eastus"
  name        = "skaf-psql"
  environment = "prod"
  additional_tags = {
    Owner      = "Organization_Name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "postgresql_flexible" {
  source                     = "squareops/postgresql/azurerm"
  name                       = local.name
  environment                = local.environment
  resource_group_name        = "pg-flexible"  # Specify the name of the resource group to be created
  resource_group_location    = local.region   # Specify the region of the resource group to be created
  create_vnet                = "true"         # set "true" to create a fresh vnet for the database server.
  vnet_resource_group_name   = "demo-rg"      # If vnet creation is set to false, specify the resource group name where vnet is present.
  vnet_name                  = "vnet-test"    # If vnet creation is set to false, specify the vnet name here.
  vnet_id                    = ""             # If vnet creation is set to false, specify the vnet id here.
  vnet_address_space         = "10.10.0.0/16" # vnet will be created with specified CIDR's. Do not specify while passing existing vnet resource group, name & id
  subnet_cidr                = "10.20.3.0/28" # New subnet will be created with "Microsoft.Storage" service endpoint.
  administrator_username     = "adminuser"
  administrator_password     = "Password@123"
  pg_version                 = "12"
  zones                      = "2"
  storage_mb                 = "131072"
  sku_name                   = "GP_Standard_D2s_v3"
  backup_retention_days      = "7"
  db_collation               = "en_US.UTF8"
  db_charset                 = "UTF8"
  diagnostic_setting_enabled = "true" # For logging and monitoring
  start_ip_address           = "10.10.0.0"
  end_ip_address             = "10.10.0.255"
  maintenance_window = {
    day_of_week  = 3
    start_hour   = 3
    start_minute = 0
  }
  tags = local.additional_tags
}