locals {
  appServiceLinux = var.appServiceTemplate.appServicePlan.os_type == "Linux" ? var.appServiceTemplate.appService : {}
  appServiceWindows = var.appServiceTemplate.appServicePlan.os_type == "Linux" ? {} : var.appServiceTemplate.appService
}