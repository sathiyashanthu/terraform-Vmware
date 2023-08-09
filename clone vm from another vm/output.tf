output "VM_IP_Address" {
  value = vsphere_virtual_machine.ubu-testing.guest_ip_addresses
}