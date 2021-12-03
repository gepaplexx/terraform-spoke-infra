variable "authorized_key" {
  type = string
  description = "authorized key used to log in to all vms in the spoke network. authorized_key for user 'core' on all ocp vms and authorized_key for user 'ansible' on all other vms."
}

###############################
# Spoke network configuration #
###############################

variable "spoke_mac_prefix" {
  type = string
  description = "MAC address prefix used for each vm in the spoke network."
}

variable "spoke_network_name" {
  type = string
  description = "Name of the network. preferably use the FQDN of the ocp cluster."
}

########################
# vmware configuration #
########################

variable "vmware_host" {
  type = string
  description = "The vsphere host name or ip used for authentication."
}
variable "vmware_user" {
  type = string
  description = "The vsphere user used for authentication."
}

variable "vmware_password" {
  type = string
  description = "The vsphere passwordused for authentication."
}

variable "vmware_datacenter" {
  type = string
  description = "The vsphere datacenter name."
}

variable "vmware_computecluster" {
  type = string
  description = "The vsphere computecluster name."
}

variable "vmware_datastore" {
  type = string
  description = "The vsphere datastore name."
}

variable "vmware_template" {
  type = string
  description = "The vsphere vm template used to provision new vms."
}

#############################
# VM resource configuration #
#############################

variable "loadbalancer_vm_cpu" {
  type = number
  description = "Specify the cpu for service vms."
}

variable "loadbalancer_vm_memory_mb" {
  type = number
  description = "Specify the ram in MB for service vms."
}