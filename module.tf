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
  for_each = var.appServiceTemplate.appServicePlan

  userDefinedString = "${var.userDefinedString}-${each.key}"
  env = var.env
  group = var.group
  project = var.project
  resource_groups = var.resource_groups
  subnets = var.subnets
  ase = module.AppServiceEnvironment.ase_id
  appServicePlan = merge(each.value, {ase = module.AppServiceEnvironment.ase_id})
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
  appServiceLinux = each.value
  asp = local.asp_id
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
  appServiceWindows = each.value
  asp = local.asp_id
  tags = var.tags
}

module "private_dns_zone" {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-private_dns_zone.git?ref=v1.0.2"
  # for_each = var.privateDNSzone

  private_dns_zone = {resource_group = "DNS", core_link_enabled = true}
  name = "${module.AppServiceEnvironment.ase_name}.appserviceenvironment.net"
  resource_groups = var.resource_groups
  vnet_id = var.vnet.id
  tags = var.tags
}
