output "resource_group_name" {
  description = "The name of the Azure Resource Group."
  value       = azurerm_resource_group.default.name
}

output "virtual_network_name" {
  description = "The name of the Azure Virtual Network."
  value       = var.create_vnet == true ? azurerm_virtual_network.default[0].name : var.vnet_name
}

output "subnet_name" {
  description = "The name of the Azure Subnet."
  value       = azurerm_subnet.default.name
}

output "private_dns_zone_name" {
  description = "The name of the Azure Private DNS Zone."
  value       = azurerm_private_dns_zone.default.name
}

output "private_dns_zone_link_name" {
  description = "The name of the Azure Private DNS Zone Virtual Network Link."
  value       = azurerm_private_dns_zone_virtual_network_link.default.name
}

output "postgresql_server_name" {
  description = "The name of the Azure PostgreSQL Flexible Server."
  value       = azurerm_postgresql_flexible_server.default.name
}

output "postgresql_database_name" {
  description = "The name of the Azure PostgreSQL Flexible Server Database."
  value       = azurerm_postgresql_flexible_server_database.default.name
}
