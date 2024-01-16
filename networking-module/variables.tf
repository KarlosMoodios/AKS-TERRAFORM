variable "networking_resource_group_name" {
  description = "The resource group name for the networking module."
  type = string
  default = "networking_resource_group"
}

variable "location" {
  description = "The location of the server where the resources are stored."
  type = string
  default = "UK South"
}

variable "vnet_address_space" {
  description = "List of address spaces for the Virtual Network (VNet)."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable source_address_prefix {
  description = "Your public ip address."
  type = string
}