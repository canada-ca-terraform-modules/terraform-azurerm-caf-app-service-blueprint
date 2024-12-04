variable "appServiceTemplate" {
  description = "App Service template to deploy"
  type        = any
  default     = {}
}


module "appServiceTemplate" {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-app-service-blueprint.git?ref=v1.0.1"
  # source = "/home/max/devops/modules/terraform-azurerm-caf-app-service-template"
  for_each = var.appServiceTemplate

  userDefinedString = each.key
  location = var.location
  env = var.env
  group = var.group
  project = var.project
  resource_groups = local.resource_groups_all
  subnets = local.subnets
  appServiceTemplate = each.value
  vnet = local.Project-vnet 
  tags = var.tags
}