variable "client_id" {
    description = "The client ID."
    type = string
    sensitive = true
}

variable "client_secret" {
    description = "The client secret."
    type = string
    sensitive = true
}

variable "subscription_id" {
    description = "The subscription ID."
    type = string
    sensitive = true
}

variable "tenant_id" {
    description = "The tenant ID."
    type = string
    sensitive = true
}

variable "public_ip" {
    description = "The public ip address."
    type = string
    sensitive = true
}