# Azure PostgresQL
![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>
This Terraform module provisions an Azure PostgreSQL database on Microsoft Azure. Azure PostgreSQL is a managed database service that simplifies the setup, operation, and scalability of relational databases in the cloud. This module is designed to facilitate the deployment of PostgreSQL databases within the Azure environment, enabling seamless management and utilization of the database resources.

## Features:
1. **Managed Service**: Azure Database for PostgreSQL is a fully managed service, meaning Microsoft handles tasks such as backups, patches, updates, and routine maintenance, allowing you to focus on your application rather than the database infrastructure.

2. **Scalability**: You can easily scale your PostgreSQL database resources up or down as needed, whether it's increasing compute power or storage capacity. This elasticity ensures that your database can handle varying workloads.

3. **High Availability**: Azure Database for PostgreSQL offers built-in high availability with automatic failover. It replicates your data to multiple nodes and can quickly recover from failures to minimize downtime.

4. **Security**: The service provides robust security features, including firewall rules, virtual network service endpoints, data encryption at rest, and SSL/TLS connections to ensure the privacy and integrity of your data.

5. **Geo-Replication**: You can set up geo-replication to replicate your data to another Azure region for disaster recovery purposes or to serve global users with low-latency access.

6. **Automatic Backups**: Regular automated backups are performed, and you can specify retention policies. You can also initiate manual backups or snapshots for point-in-time recovery.

7. **Point-in-Time Recovery**: With automated backups and continuous transaction log backups, you can restore your database to a specific point in time in case of data corruption or accidental changes.

8. **Flexible Pricing**: Azure Database for PostgreSQL offers various pricing tiers based on performance, storage, and features required. This allows you to choose the best fit for your application's needs and budget.

9. **Compatibility**: The service supports various PostgreSQL database versions, including popular extensions, and provides compatibility with standard PostgreSQL tools, libraries, and applications.

10. **Monitoring and Alerts**: You can monitor database performance using Azure Monitor, which provides metrics, logs, and insights into query performance. Set up alerts based on performance thresholds.

11. **Integrated Development Tools**: Azure provides integration with popular development tools like Azure Data Studio, which simplifies database development, management, and querying.

12. **Automated Patching**: The service regularly applies security and system updates to the underlying infrastructure without requiring your intervention.

13. **Global Reach**: Azure has a vast global network of data centers, allowing you to deploy Azure Database for PostgreSQL close to your users for low-latency access.

## Usage Example

```hcl
module "postgresql_flexible" {
  source = "squareops/postgresql/azurerm"
  
  name                       = "pg-server"    # Name must be unique
  environment                = "prod"
  resource_group_name        = "pg-flexible"  # Specify the name of the resource group to be created
  resource_group_location    = "eastus"       # Specify the region of the resource group to be created
  create_vnet                = "false"        # set "true" to create a fresh vnet for the database server.
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
  tags                       = { Name = pg-server, Department  = Engineering}
}
```
Refer [examples](https://github.com/squareops/terraform-azurerm-postgresql/tree/main/examples/complete) for more details

## Permissions

Required permissions to create resources from this module are mentioned [here](https://github.com/squareops/terraform-azurerm-postgresql/tree/main/roles.md)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_workspace.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.11.0/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.11.0/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_postgresql_flexible_server.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.11.0/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_database.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.11.0/docs/resources/postgresql_flexible_server_database) | resource |
| [azurerm_postgresql_flexible_server_firewall_rule.firewall_rules](https://registry.terraform.io/providers/hashicorp/azurerm/3.11.0/docs/resources/postgresql_flexible_server_firewall_rule) | resource |
| [azurerm_private_dns_zone.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.11.0/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.11.0/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_resource_group.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.11.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.11.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.11.0/docs/resources/virtual_network) | resource |
| [azurerm_monitor_diagnostic_categories.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.11.0/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | Password for the database server administrator | `string` | `"Password@123"` | no |
| <a name="input_administrator_username"></a> [administrator\_username](#input\_administrator\_username) | Username for the database server administrator | `string` | `"admin"` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Number of days to retain backups | `string` | `"7"` | no |
| <a name="input_create_vnet"></a> [create\_vnet](#input\_create\_vnet) | Set to true to create a fresh vnet for the database server. | `bool` | `true` | no |
| <a name="input_db_charset"></a> [db\_charset](#input\_db\_charset) | Character set for the database server | `string` | `"UTF8"` | no |
| <a name="input_db_collation"></a> [db\_collation](#input\_db\_collation) | Collation for the database server | `string` | `"en_US.UTF8"` | no |
| <a name="input_diagnostic_setting_enabled"></a> [diagnostic\_setting\_enabled](#input\_diagnostic\_setting\_enabled) | Enable the diagnostic setting. | `bool` | `false` | no |
| <a name="input_end_ip_address"></a> [end\_ip\_address](#input\_end\_ip\_address) | End IP address of the firewall rules. | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Enviornment tag of the pg server | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource. | `string` | `"eastus"` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Map of maintenance window configuration. | `map(number)` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Prefix of the resource name. | `string` | `""` | no |
| <a name="input_pg_version"></a> [pg\_version](#input\_pg\_version) | Version of PostgreSQL to be installed on the server | `string` | `"12"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Specify the region of the resource group to be created | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specify the name of the resource group to be created | `string` | `"pg-flexible"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Name of the SKU for the database server | `string` | `"GP_Standard_D2s_v3"` | no |
| <a name="input_start_ip_address"></a> [start\_ip\_address](#input\_start\_ip\_address) | Start ip address of the firewall rules. | `string` | `""` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | Storage size in MB for the database server | `string` | `"131072"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | New subnet will be created with 'Microsoft.Storage' service endpoint. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with your network and subnets. | `map(string)` | <pre>{<br>  "tag1": "",<br>  "tag2": ""<br>}</pre> | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | Vnet will be created with specified CIDR's. | `string` | `""` | no |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | If vnet creation is set to false, specify the vnet id here. | `string` | `""` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | If vnet creation is set to false, specify the vnet name here. | `string` | `""` | no |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | The resource group name of the vnet where it is present | `string` | `""` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Number of availability zones for the database server | `string` | `"1"` | no |

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
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contribute & Issue Report

To report an issue with a project:

  1. Check the repository's [issue tracker](https://github.com/squareops/terraform-azurerm-postgresql/issues) on GitHub
  2. Search to check if the issue has already been reported
  3. If you can't find an answer to your question in the documentation or issue tracker, you can ask a question by creating a new issue. Make sure to provide enough context and details.

## License

Apache License, Version 2.0, January 2004 (https://www.apache.org/licenses/LICENSE-2.0)

## Support Us

To support our GitHub project by liking it, you can follow these steps:

  1. Visit the repository: Navigate to the [GitHub repository]()

  2. Click the "Star" button: On the repository page, you'll see a "Star" button in the upper right corner. Clicking on it will star the repository, indicating your support for the project.

  3. Optionally, you can also leave a comment on the repository or open an issue to give feedback or suggest changes.

Staring a repository on GitHub is a simple way to show your support and appreciation for the project. It also helps to increase the visibility of the project and make it more discoverable to others.

## Who we are

We believe that the key to success in the digital age is the ability to deliver value quickly and reliably. That’s why we offer a comprehensive range of DevOps & Cloud services designed to help your organization optimize its systems & Processes for speed and agility.

  1. We are an AWS Advanced consulting partner which reflects our deep expertise in AWS Cloud and helping 100+ clients over the last 5 years.
  2. Expertise in Kubernetes and overall container solution helps companies expedite their journey by 10X.
  3. Infrastructure Automation is a key component to the success of our Clients and our Expertise helps deliver the same in the shortest time.
  4. DevSecOps as a service to implement security within the overall DevOps process and helping companies deploy securely and at speed.
  5. Platform engineering which supports scalable,Cost efficient infrastructure that supports rapid development, testing, and deployment.
  6. 24*7 SRE service to help you Monitor the state of your infrastructure and eradicate any issue within the SLA.

We provide [support](https://squareops.com/contact-us/) on all of our projects, no matter how small or large they may be.

To find more information about our company, visit [squareops.com](https://squareops.com/), follow us on [Linkedin](https://www.linkedin.com/company/squareops-technologies-pvt-ltd/), or fill out a [job application](https://squareops.com/careers/). If you have any questions or would like assistance with your cloud strategy and implementation, please don't hesitate to [contact us](https://squareops.com/contact-us/).