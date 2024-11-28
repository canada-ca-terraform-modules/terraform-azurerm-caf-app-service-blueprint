<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_AppServiceEnvironment"></a> [AppServiceEnvironment](#module\_AppServiceEnvironment) | github.com/canada-ca-terraform-modules/terraform-caf-app_service_environment.git | v1.0.4 |
| <a name="module_AppServicePlan"></a> [AppServicePlan](#module\_AppServicePlan) | github.com/canada-ca-terraform-modules/terraform-caf-azurerm-app_service_plan.git | v1.0.3 |
| <a name="module_appServiceLinux"></a> [appServiceLinux](#module\_appServiceLinux) | github.com/canada-ca-terraform-modules/terraform-azurerm-caf-app_service_linux.git | v1.0.3 |
| <a name="module_appServiceWindows"></a> [appServiceWindows](#module\_appServiceWindows) | github.com/canada-ca-terraform-modules/terraform-azurerm-caf-app_service_windows.git | v1.0.2 |
| <a name="module_private_dns_zone"></a> [private\_dns\_zone](#module\_private\_dns\_zone) | github.com/canada-ca-terraform-modules/terraform-azurerm-caf-private_dns_zone.git | v1.0.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appServiceTemplate"></a> [appServiceTemplate](#input\_appServiceTemplate) | Object containing all parameters for the Linux App Service | `any` | `{}` | no |
| <a name="input_env"></a> [env](#input\_env) | (Required) Env value for the name of the resource | `string` | n/a | yes |
| <a name="input_group"></a> [group](#input\_group) | (Required) Group value for the name of the resource | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location for the resource | `string` | `"canadacentral"` | no |
| <a name="input_project"></a> [project](#input\_project) | (Required) Project value for the name of the resource | `string` | n/a | yes |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | Resouce group object containing a list of resource group in the target project | `any` | `null` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnet object containing a list of subnets in the target project | `any` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Maps of tags that will be applied to the resource | `map(string)` | `{}` | no |
| <a name="input_userDefinedString"></a> [userDefinedString](#input\_userDefinedString) | (Required) UserDefinedString value for the name of the resource | `string` | n/a | yes |
| <a name="input_vnet"></a> [vnet](#input\_vnet) | (Required) Vnet ID to link to DNS zone to | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->