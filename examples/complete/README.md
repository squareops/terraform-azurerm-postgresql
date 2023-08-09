# Azure PostgresQL
![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>
This Terraform module provisions an Azure PostgreSQL database on Microsoft Azure. Azure PostgreSQL is a managed database service that simplifies the setup, operation, and scalability of relational databases in the cloud. This module is designed to facilitate the deployment of PostgreSQL databases within the Azure environment, enabling seamless management and utilization of the database resources.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.11.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_postgresql_flexible"></a> [postgresql\_flexible](#module\_postgresql\_flexible) | squareops/postgresql/azurerm | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_postgresql_database_name"></a> [postgresql\_database\_name](#output\_postgresql\_database\_name) | The name of the Azure PostgreSQL Flexible Server Database. |
| <a name="output_postgresql_server_name"></a> [postgresql\_server\_name](#output\_postgresql\_server\_name) | The name of the Azure PostgreSQL Flexible Server. |
| <a name="output_private_dns_zone_link_name"></a> [private\_dns\_zone\_link\_name](#output\_private\_dns\_zone\_link\_name) | The name of the Azure Private DNS Zone Virtual Network Link. |
| <a name="output_private_dns_zone_name"></a> [private\_dns\_zone\_name](#output\_private\_dns\_zone\_name) | The name of the Azure Private DNS Zone. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the Azure Resource Group. |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | The name of the Azure Subnet. |
| <a name="output_virtual_network_name"></a> [virtual\_network\_name](#output\_virtual\_network\_name) | The name of the Azure Virtual Network. |
