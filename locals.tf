locals {
  appServiceLinux = {for app, v in var.appServiceTemplate.appService : app => v if var.appServiceTemplate.appServicePlan[v.asp].os_type == "Linux"}
  appServiceWindows = {for app, v in var.appServiceTemplate.appService : app => v if var.appServiceTemplate.appServicePlan[v.asp].os_type == "Windows"}
  asp_id = {for name, param in try(var.appServiceTemplate.appServicePlan, {}): name => module.AppServicePlan[name].asp_id}
}