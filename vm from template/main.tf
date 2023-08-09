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
  name          = var.template_name
  datacenter_id = data.vsphere_datacenter.dc.id
}


# Set VM parameteres
resource "vsphere_virtual_machine" "ubu-testing" {
  name             = var.vm_name
  num_cpus         = var.num_cpu
  memory           = var.num_memory
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  network_interface {
    network_id = data.vsphere_network.network.id
  }


  disk {
    label            = data.vsphere_virtual_machine.template.disks[0].label
    thin_provisioned = data.vsphere_virtual_machine.template.disks[0].thin_provisioned
    size             = var.disk_size
  }


  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
      }
}