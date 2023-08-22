resource "azurerm_resource_group" "default" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "default" {
  count               = var.create_vnet ? 1 : 0
  depends_on          = [azurerm_resource_group.default]
  name                = format("%s-%s-%s", var.environment, var.name, "vnet")
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  address_space       = [var.vnet_address_space]
  tags                = var.tags
}

resource "azurerm_subnet" "default" {
  depends_on           = [azurerm_resource_group.default]
  name                 = format("%s-%s-%s", var.environment, var.name, "subnet")
  virtual_network_name = var.create_vnet == true ? azurerm_virtual_network.default[0].name : var.vnet_name
  resource_group_name  = var.create_vnet == true ? azurerm_resource_group.default.name : var.vnet_resource_group_name
  address_prefixes     = [var.subnet_cidr]
  service_endpoints    = ["Microsoft.Storage"]

  delegation {
    name = "pg-flexible"

    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

resource "azurerm_private_dns_zone" "default" {
  name                = format("%s-%s-%s", var.environment, var.name, "pdz.postgres.database.azure.com")
  resource_group_name = var.create_vnet == true ? azurerm_resource_group.default.name : var.vnet_resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "default" {
  name                  = format("%s-%s-%s", var.environment, var.name, "pdzvnetlink.com")
  depends_on            = [azurerm_resource_group.default]
  private_dns_zone_name = azurerm_private_dns_zone.default.name
  virtual_network_id    = var.create_vnet == true ? azurerm_virtual_network.default[0].id : var.vnet_id
  resource_group_name   = var.create_vnet == true ? azurerm_resource_group.default.name : var.vnet_resource_group_name
  tags                  = var.tags

}

resource "azurerm_postgresql_flexible_server" "default" {
  name                   = format("%s-%s-%s", var.environment, var.name, "server")
  resource_group_name    = azurerm_resource_group.default.name
  location               = azurerm_resource_group.default.location
  version                = var.pg_version
  delegated_subnet_id    = azurerm_subnet.default.id
  private_dns_zone_id    = azurerm_private_dns_zone.default.id
  administrator_login    = var.administrator_username
  administrator_password = var.administrator_password
  zone                   = var.zones
  storage_mb             = var.storage_mb
  sku_name               = var.sku_name
  backup_retention_days  = var.backup_retention_days
  tags                   = var.tags
  depends_on             = [azurerm_private_dns_zone_virtual_network_link.default]

  dynamic "maintenance_window" {
    for_each = var.maintenance_window != null ? toset([var.maintenance_window]) : toset([])

    content {
      day_of_week  = lookup(maintenance_window.value, "day_of_week", 0)
      start_hour   = lookup(maintenance_window.value, "start_hour", 0)
      start_minute = lookup(maintenance_window.value, "start_minute", 0)
    }
  }
}

resource "azurerm_postgresql_flexible_server_database" "default" {
  depends_on = [azurerm_postgresql_flexible_server.default]
  name       = format("%s-%s-%s", var.environment, var.name, "db")
  server_id  = azurerm_postgresql_flexible_server.default.id
  collation  = var.db_collation
  charset    = var.db_charset
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "firewall_rules" {
  depends_on       = [azurerm_postgresql_flexible_server_database.default]
  name             = format("%s-%s-%s", var.environment, var.name, "rules")
  server_id        = azurerm_postgresql_flexible_server.default.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}

data "azurerm_monitor_diagnostic_categories" "this" {
  count       = var.diagnostic_setting_enabled ? 1 : 0
  resource_id = azurerm_postgresql_flexible_server.default.id
}

resource "azurerm_log_analytics_workspace" "example" {
  count               = var.diagnostic_setting_enabled ? 1 : 0
  depends_on          = [azurerm_postgresql_flexible_server.default]
  name                = format("%s-%s-%s", var.environment, var.name, "workspace")
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  depends_on                     = [azurerm_postgresql_flexible_server.default, azurerm_log_analytics_workspace.example]
  count                          = var.diagnostic_setting_enabled ? 1 : 0
  name                           = format("%s-%s-%s", var.environment, var.name, "monitor")
  target_resource_id             = azurerm_postgresql_flexible_server.default.id
  log_analytics_workspace_id     = azurerm_log_analytics_workspace.example[0].id
  log_analytics_destination_type = "Dedicated"

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.this[0].metrics
    content {
      category = metric.value
    }
  }

  lifecycle {
    ignore_changes = [log_analytics_destination_type] # TODO remove when issue is fixed: https://github.com/Azure/azure-rest-api-specs/issues/9281
  }
}