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

variable "clone_machine_name" {
  description = "vm clone_machine"
  type = string
}

variable "vm_name" {
  description = "vm name"
  type = string
}

variable "num_cpu" {
  description = "cpu core value"
  type = number
}

variable "num_memory" {
  description = "memory value"
  type = number
}

variable "guest_id" {
  description = "id of guest os"
  type = string
}
variable "disk_size" {
  description = "size of the disk"
  type = number
}
