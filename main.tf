resource vsphere_virtual_machine "loadbalancer" {
  count           = var.loadbalancer_vm_count
  name             = "loadbalancer${count.index}.${var.spoke_network_name}"
  resource_pool_id = "${data.vsphere_compute_cluster.cc.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.ds.id}"
  folder           = "GP/${var.spoke_network_name}"

  num_cpus  = "${var.loadbalancer_vm_cpu}"
  memory    = "${var.loadbalancer_vm_memory_mb}"
  guest_id  = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  cdrom {
    client_device = true
  }

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
    use_static_mac = "true"
    mac_address = "${var.spoke_mac_prefix}:${format("%02X", (count.index + 4))}"
  }
  wait_for_guest_net_timeout = 0

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
  }

  vapp {
    properties ={
      hostname = "loadbalancer${count.index}"
      user-data = base64encode(templatefile("${path.module}/cloudinit/cloud-config.yaml.tpl", {
        authorized_key = "${var.authorized_key}"
      }))
    }
  }
}