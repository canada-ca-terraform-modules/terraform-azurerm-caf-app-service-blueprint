module "AppServiceEnvironment" {
  source = "github.com/canada-ca-terraform-modules/terraform-caf-app_service_environment.git?ref=v1.0.4"

  userDefinedString = var.userDefinedString
  env = var.env
  group = var.group
  project = var.project
  resource_groups = var.resource_groups
  subnets = var.subnets
  appServiceEnvironment = var.appServiceTemplate.appServiceEnvironment
  tags = var.tags
}

module "AppServicePlan" {
  source = "github.com/canada-ca-terraform-modules/terraform-caf-azurerm-app_service_plan.git?ref=v1.0.3"

  userDefinedString = var.userDefinedString
  env = var.env
  group = var.group
  project = var.project
  resource_groups = var.resource_groups
  subnets = var.subnets
  ase = module.AppServiceEnvironment.ase_id
  appServicePlan = merge(var.appServiceTemplate.appServicePlan, {ase = module.AppServiceEnvironment.ase_id})
  tags = var.tags
}

module "appServiceLinux" {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-app_service_linux.git?ref=v1.0.3"
  for_each = local.appServiceLinux

  userDefinedString = "${var.userDefinedString}-${each.key}"
  env = var.env
  group = var.group
  project = var.project
  resource_groups = var.resource_groups
  subnets = var.subnets
  appServiceLinux = merge(each.value, {asp = module.AppServicePlan.asp_id})
  asp = module.AppServicePlan.asp_id
  tags = var.tags
}

module "appServiceWindows" {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-app_service_windows.git?ref=v1.0.2"
  for_each = local.appServiceWindows

  userDefinedString = "${var.userDefinedString}-${each.key}"
  env = var.env
  group = var.group
  project = var.project
  resource_groups = var.resource_groups
  subnets = var.subnets
  appServiceWindows = merge(each.value, {asp = module.AppServicePlan.asp_id})
  asp = module.AppServicePlan.asp_id
  tags = var.tags
}

# module "private_dns_zone" {
#   source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-private_dns_zone.git?ref=v1.0.2"
#   # for_each = var.privateDNSzone

#   private_dns_zone = {resource_group = "DNS", core_link_enabled = true}
#   name = "${module.AppServiceEnvironment.ase_name}.appserviceenvironment.net"
#   resource_groups = var.resource_groups
#   vnet_id = var.vnet.id
#   tags = var.tags
# }

# module "Project-snet" {
#   source          = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-subnet?ref=v3.1.1"
#   virtual_network = var.vnet
#   resource_group  = var.resource_groups.Network
#   env             = var.env
#   subnet = {
#     userDefinedString                              = "ASE"
#     address_prefixes                               = [cidrsubnet(var.vnet.address_space[0], 3, 7)]
#     private_link_service_network_policies_enabled  = false
#     private_endpoint_network_policies              = "Disabled"
#     service_endpoints                              = ["Microsoft.Storage"]
#     delegation                                     = {name = "acctestdelegation",service_delegation = {name = "Microsoft.Web/hostingEnvironments",actions = ["Microsoft.Network/virtualNetworks/subnets/action"]}}
#   }
# }