# Terraform: spoke-infra

![MIT](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/gepaplexx/terraform-spoke-infra?style=flat-square)
![Maintenance](https://img.shields.io/maintenance/yes/2022?style=flat-square)

Create infra vm(s) for a spoke network with terraform.

Variable Name | Type | Description
------------ | ------------- | -------------
authorized_key | string | authorized key used to log in to all vms in the spoke network. authorized_key for user 'core' on all ocp vms and authorized_key for user 'ansible' on all other vms.
spoke_mac_prefix | string | MAC address prefix used for each vm in the spoke network.
spoke_network_name | string | Name of the network. preferably use the FQDN of the ocp cluster.
vmware_host | string | The vsphere host name or ip used for authentication.
vmware_user | string | The vsphere user used for authentication.
vmware_password | string | The vsphere passwordused for authentication.
vmware_datacenter | string | The vsphere datacenter name.
vmware_computecluster | string | The vsphere computecluster name.
vmware_datastore | string | The vsphere datastore name.
vmware_template | string | The vsphere vm template used to provision new vms.
loadbalancer_vm_cpu | number | Specify the cpu for service vms.
loadbalancer_vm_memory_mb | number | Specify the ram in MB for service vms.

## License

MIT

## Contributions

- [@ckaserer](https://github.com/ckaserer)
