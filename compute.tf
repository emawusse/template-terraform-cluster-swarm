resource "openstack_compute_instance_v2" "compute_bastion" {
  name            = var.bastion_name
  image_id        = var.image_id
  flavor_id       = var.flavor_bastion_id
  key_pair        = openstack_compute_keypair_v2.public_key.name
  security_groups = ["${openstack_compute_secgroup_v2.secgroup_bastion.name}"]
  network { name = openstack_networking_network_v2.network_bastion.name }
  network { name = openstack_networking_network_v2.network_swarm.name }
}


resource "openstack_compute_instance_v2" "compute_managers" {
  count           = var.nbre_managers
  name            = var.managers_name[count.index]
  image_id        = var.image_id
  flavor_id       = var.flavor_managers_id
  key_pair        = openstack_compute_keypair_v2.public_key.name
  security_groups = ["${openstack_compute_secgroup_v2.secgroup_swarm.name}"]
  network { name = openstack_networking_network_v2.network_swarm.name }
  network { name = openstack_networking_network_v2.network_bastion.name }

}

resource "openstack_compute_instance_v2" "compute_workers" {
  count           = var.nbre_workers
  name            = var.workers_name[count.index]
  image_id        = var.image_id
  flavor_id       = var.flavor_workers_id
  key_pair        = openstack_compute_keypair_v2.public_key.name
  security_groups = ["${openstack_compute_secgroup_v2.secgroup_swarm.name}"]
  network { name = openstack_networking_network_v2.network_swarm.name }
  network { name = openstack_networking_network_v2.network_bastion.name }
}
