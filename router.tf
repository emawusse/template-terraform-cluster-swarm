#Configuration du routeur pour le réseau
resource "openstack_networking_router_v2" "router" {
  name                = var.router_name
  external_network_id = var.external_net_id
}

resource "openstack_networking_router_interface_v2" "interface_subnet_bastion" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet_bastion.id
}
