variable "tags" {
  description = "Maps of tags that will be applied to the resource"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "(Required) Env value for the name of the resource"
  type        = string
}

variable "group" {
  description = "(Required) Group value for the name of the resource"
  type        = string
}

variable "project" {
  description = "(Required) Project value for the name of the resource"
  type        = string
}

variable "userDefinedString" {
  description = "(Required) UserDefinedString value for the name of the resource"
  type        = string
}

variable "location" {
  description = "Azure location for the resource"
  type        = string
  default     = "canadacentral"
}

variable "resource_groups" {
  description = "Resouce group object containing a list of resource group in the target project"
  type        = any
  default     = null
}

variable "subnets" {
  description = "Subnet object containing a list of subnets in the target project"
  type        = any
  default     = null
}

variable "vnet" {
  description = "(Required) Vnet ID to link to DNS zone to"
  type        = any
}

variable "appServiceTemplate" {
  description = "Object containing all parameters for the Linux App Service"
  type        = any
  default     = {}
}


