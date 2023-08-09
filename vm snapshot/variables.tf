#set of VM variables to authenticate to the vCenter
variable "vsphere_server" {
  description = "vSphere server"
  type        = string
}

variable "vsphere_user" {
  description = "vSphere username"
  type        = string
}

variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  sensitive   = true
}

variable "datacenter_name" {
  description = "vSphere datacenter"
  type = string
}

variable "cluster_name" {
  description = "datacenter cluster"
  type = string
}

variable "datastore_name" {
  description = "vSphere datastore"
  type = string
}

variable "network_name" {
  description = "vSphere network"
  type = string
}

variable "vm_name" {
  description = "name of the vm for which snapshot to be taken"
  type = string
}

variable "snapshot_name" {
  description = "name of the snapshot"
  type = string
}


