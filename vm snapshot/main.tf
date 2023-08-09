#Name of the Datacenter in the vCenter
data "vsphere_datacenter" "dc" {
  name = var.datacenter_name
}
#Name of the Cluster in the vCenter
data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.dc.id
}
#Name of the Datastore in the vCenter, where VM will be deployed
data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.dc.id
}
#Name of the Portgroup in the vCenter, to which VM will be attached
data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}
#Name of the Templete in the vCenter, which will be used to the deployment
data "vsphere_virtual_machine" "template" {
  name          = var.vm_name
  datacenter_id = data.vsphere_datacenter.dc.id
}


resource "vsphere_virtual_machine_snapshot" "snap" {
  virtual_machine_uuid = data.vsphere_virtual_machine.template.id
  snapshot_name        = var.snapshot_name
  description          = "This is a snapshot"
  memory               = "true"
  quiesce              = "true"
}