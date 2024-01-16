# AKS Cluster
### Table of Contents:
    1. A description of the project
    2. Installation instructions
    3. Usage instructions
    4. File structure of the project
    5. License information 

1. A description of the project: 
    - What it does:
        - 
        - 
        - 
        - 
    - The aim of the project:
        - 
    - What you learned:
        - 

1. Installation instructions
    - 

1. Usage instructions
    - 
    - 
    - 
    - 
    - 
1. File structure of the project
    ### aks-terraform
    - main.tf
        - blah blah blah
    - aks-cluster-module
        #### Defining the resources for the cluster module
        - main.tf:
            - azurerm_kubernetes_cluster, aks_cluster - This resource defines the construction of the aks cluster. It needs:
                - name - The cluster name.
                - location - The location the cluster is stored.
                - networking resource group name - The name of the resource group the cluster is stored in.
                - dns prefix - The prefix to the clusters domain name.
                - kubernetes version - Which version of kubernetes the cluster will be using.
                - default node pool:
                    - name - name of the node pool.
                    - node_count - how many nodes are in the node pool.
                    - vm_size -  the size of the virtual machine.
                    - enable_auto_scaling - True of false to enable auto scaling of the cluster.
                    - min_count - minimum node count for the cluster.
                    - max_count - maximum node count for the cluster.
                - service principal:
                    - client id - The client id used to manage the cluster.
                    - client secret - The client secret used to control access to the cluster.
        #### Defining the variables for the cluster module
        - variables.tf - The variables for the aks-cluster consist of newly defined variables as well as some variables provided by the networking module. The newly defind variables each have a description, default value and a type. The variables are as follows:
            - aks_cluster_name
            - cluster_location
            - dns_prefix
            - kubernetes_version
            - service_principal_client_id
            - service_principal_client_secret
        - The input variables from the networking module outputs for the cluster module each have a description and a type. The variables are:
            - resource_group_name
            - vnet_id
            - control_plane_subnet_id
            - worker_node_subnet_id
            - aks_nsg_id
        #### Defining the outputs from the cluster module
        - outputs.tf - These outputs are going to be used by the main.tf file in the parent directory of both modules. (aks-terraform)
        The outputs are:
            - aks_cluster_name - The cluster name.
            - aks_cluster_id - The id of the cluster.
            - aks_kubeconfig - kubeconfig file for accessing the cluster.
    - networking-module
        #### Defining the resources for the network module.
        - main.tf
            
            ##### Base resources
            - azurerm_resource_group, networking. Named "networking". This is where the resource_group_name and location variables are used to create the resource group for storing any information to do with the networking module of the AKS cluster. 
            - azurerm_virtual_network, aks_vnet - Defines the virtual networking for the AKS cluster. We name it "aks_vnet", set the address space using the variable created in variables.tf and set the location and resource_group_name equal to the azurerm_resource_group credentials respectfully. 
            ##### Subnets
            - azurerm_subnet, control_plane_subnet - Named "control_plane_subnet", this is where we define a subnet for control plane which collects logs for kube-apiserver by exposing the underlying Kubernetes APIs.
            - azurerm_subnet, worker_node_subnet - Named worker_node_subnet, this is where we define a subnet for worker nodes.
            - Each subnet has a name unique to itself, attaches to the resource group and virtual network. Also, they use different address spaces.
            ##### Network/Security rules
            - Network Security Group (NSG) for the AKS vnet. azurerm_network_security_group, aks_nsg is a resource defined to add security to the virtual network. Named "aks-nsg" and attached to the location and resource_group_name variables as before in other resources.
            - Allow inbound traffic to kube-apiserver from the local machines public ip address. This network rule enables the local machines public ip address to send internet traffic/data tot he kube-apiserver. Named "kube-apiserver-rule", it is set to allow inbound traffic over a TCP443 protocol from xx.xx.xxx.xx ip address. It also has the resource_group_name and the security_group_name set.
            - azurerm_network_security_rule, ssh - This rule is set to allow inbound traffic from ssh, over TCP22 from xx.xx.xxx.xx ip address. It also has the resource_group_name and the security_group_name set.
        #### Defining the variables for the network module.
        - variables.tf - Defines the variables used within the networking module. Each variable has a description, type and default value.
            - resource_group_name, 
            - location, 
            - vnet_address_space. 
        #### Defining the outputs from the network module
        - outputs.tf - This is where outputs are defined. Each output has a description and a value.
            - vnet_id - set to the id of aks_vnet,
            - control_plane_subnet_id - set to the id of control_plane_subnet,
            - worker_node_subnet_id - set to the id of worker_node_subnet,
            - networking_resource_group_name - set to the id of networking,
            - aks_nsg_id - set to the id of aks_nsg.
    - Once everything has been provisioned correctly, run `terraform init` while in the directory for the networking module to initialise this module.
            

1. License information 
    ##### __Copyright Karlos Moodios. All rights reserved.__