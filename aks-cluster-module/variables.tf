# aks-cluster/variables.tf

variable "aks_cluster_name" {
    description = "The name of the aks cluster."
    default = "terraform_aks_cluster"
    type = string
}

variable "cluster_location" {
    description = "The location of the aks cluster."
    default = "UK South"
    type = string
}

variable "dns_prefix" {
    description = "The prefix to the clusters domain name."
    default = "my-aks-project"
    type = string
}

variable "kubernetes_version" {
    description = "The version of kubernetes the cluster uses."
    default = "1.27.3"
    type = string
}

variable "service_principal_client_id" {
    description = "The client id used to manage the cluster."
    type = string
}

variable "service_principal_client_secret" {
    description = "The client secret used to control access to the cluster."
    type = string
}

# Input variables from the networking module
variable "networking_resource_group_name" {
    description = "The name of the networking resource group."
    type = string
}

variable "vnet_id" {
    description = "The id for the virtual network."
    type = string
}

variable "control_plane_subnet_id" {
    description = "The id for the control plane subnet."
    type = string
}

variable "worker_node_subnet_id" {
    description = "The id for the worker node subnet."
    type = string
}

variable "aks_nsg_id" {
    description = "The id for the AKS network security group."
    type = string
}