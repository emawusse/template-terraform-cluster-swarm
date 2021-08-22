#Configuration des instances pour le cluster
resource "openstack_compute_instance_v2" "compute_bastion" {
  for_each        = var.compute_bastion
  name            = each.key
  image_id        = var.image_id
  flavor_id       = each.value
  key_pair        = openstack_compute_keypair_v2.public_key.name
  security_groups = ["${openstack_compute_secgroup_v2.secgroup_bastion.name}"]
  network { name = openstack_networking_network_v2.network_bastion.name }
}

#Configuration des instances pour le cluster
resource "openstack_compute_instance_v2" "computes_managers" {
  for_each        = var.computes_managers
  name            = each.key
  image_id        = var.image_id
  flavor_id       = each.value
  key_pair        = openstack_compute_keypair_v2.public_key.name
  security_groups = ["${openstack_compute_secgroup_v2.secgroup_swarm.name}"]
  network { name = openstack_networking_network_v2.network_swarm.name }
  network { name = openstack_networking_network_v2.network_bastion.name }
}

resource "openstack_compute_instance_v2" "computes_workers" {
  for_each        = var.computes_workers
  name            = each.key
  image_id        = var.image_id
  flavor_id       = each.value
  key_pair        = openstack_compute_keypair_v2.public_key.name
  security_groups = ["${openstack_compute_secgroup_v2.secgroup_swarm.name}"]
  network { name = openstack_networking_network_v2.network_swarm.name }
  network { name = openstack_networking_network_v2.network_bastion.name }
}
