#Configuration de l'ip floattante pour le bastion
resource "openstack_networking_floatingip_v2" "floatip_bastion" {
  pool     = var.external_net
  for_each = var.compute_bastion
}

resource "openstack_compute_floatingip_associate_v2" "associate_floatip_bastion" {
  for_each    = var.compute_bastion
  floating_ip = openstack_networking_floatingip_v2.floatip_bastion[each.key].address
  instance_id = openstack_compute_instance_v2.compute_bastion[each.key].id
}
