resource "openstack_networking_router_v2" "router" {
  name                = var.router_name
  external_network_id = "8ff6c8e7-d609-4d7e-b05d-abebddbe3b8e"
}

resource "openstack_networking_router_interface_v2" "interface_subnet_bastion" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet_bastion.id
}

resource "openstack_networking_router_interface_v2" "interface_subnet_swarm" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet_swarm.id
}
