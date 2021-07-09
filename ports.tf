# resource "openstack_networking_port_v2" "port_compute_bastion" {
#   name               = var.bastion
#   network_id         = openstack_networking_network_v2.network.id
#   admin_state_up     = "true"
#   security_group_ids = [openstack_compute_secgroup_v2.secgroup_bastion.id]
#   fixed_ip {
#     subnet_id = openstack_networking_subnet_v2.subnet_bastion.id
#   }
# }

# resource "openstack_networking_port_v2" "port_compute_manager1" {
#   name               = var.manager1
#   network_id         = openstack_networking_network_v2.network.id
#   admin_state_up     = "true"
#   security_group_ids = [openstack_compute_secgroup_v2.secgroup_managers.id]
#   fixed_ip {
#     subnet_id = openstack_networking_subnet_v2.subnet_managers.id
#   }
# }

# resource "openstack_networking_port_v2" "port_compute_manager2" {
#   name               = var.manager2
#   network_id         = openstack_networking_network_v2.network.id
#   admin_state_up     = "true"
#   security_group_ids = [openstack_compute_secgroup_v2.secgroup_managers.id]
#   fixed_ip {
#     subnet_id = openstack_networking_subnet_v2.subnet_managers.id
#   }
# }

# resource "openstack_networking_port_v2" "port_compute_manager3" {
#   name               = var.manager3
#   network_id         = openstack_networking_network_v2.network.id
#   admin_state_up     = "true"
#   security_group_ids = [openstack_compute_secgroup_v2.secgroup_managers.id]
#   fixed_ip {
#     subnet_id = openstack_networking_subnet_v2.subnet_managers.id
#   }
# }

