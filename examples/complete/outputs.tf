output "resource_group_name" {
  description = "The name of the Azure Resource Group."
  value       = module.postgresql_flexible.resource_group_name
}

output "virtual_network_name" {
  description = "The name of the Azure Virtual Network."
  value       = module.postgresql_flexible.virtual_network_name
}

output "subnet_name" {
  description = "The name of the Azure Subnet."
  value       = module.postgresql_flexible.subnet_name
}

output "private_dns_zone_name" {
  description = "The name of the Azure Private DNS Zone."
  value       = module.postgresql_flexible.private_dns_zone_name
}

output "private_dns_zone_link_name" {
  description = "The name of the Azure Private DNS Zone Virtual Network Link."
  value       = module.postgresql_flexible.private_dns_zone_link_name
}

output "postgresql_server_name" {
  description = "The name of the Azure PostgreSQL Flexible Server."
  value       = module.postgresql_flexible.postgresql_server_name
}

output "postgresql_database_name" {
  description = "The name of the Azure PostgreSQL Flexible Server Database."
  value       = module.postgresql_flexible.postgresql_database_name
}
