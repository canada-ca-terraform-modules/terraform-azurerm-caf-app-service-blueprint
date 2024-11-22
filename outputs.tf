# output "appServiceTemplate-ase" {
#   description = "Outputs the ASE object associated with the template"
#   value = module.AppServiceEnvironment.ase_object
# }

# output "appServiceTemplate-asp" {
#   description = "Outputs the ASP object associated with the template"
#   value = module.AppServicePlan.appServicePlan-object
# }

# output "appServiceTemplate-asv" {
#   description = "Outputs the App services associated with the template"
#   value = var.appServiceTemplate.appServicePlan.os_type == "Linux" ? [for i in module.appServiceLinux : i.appServiceLinux-object] : [for i in module.appServiceWindows : i.appServiceWindows-object]
# }