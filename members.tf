resource "openstack_lb_member_v2" "members_80" {
  for_each      = var.computes_workers
  name          = each.key
  pool_id       = openstack_lb_pool_v2.pool_80.id
  subnet_id     = openstack_networking_subnet_v2.subnet_bastion.id
  address       = openstack_compute_instance_v2.computes_workers[each.key].access_ip_v4
  protocol_port = 80
}

resource "openstack_lb_member_v2" "members_443" {
  for_each      = var.computes_workers
  name          = each.key
  pool_id       = openstack_lb_pool_v2.pool_443.id
  subnet_id     = openstack_networking_subnet_v2.subnet_bastion.id
  address       = openstack_compute_instance_v2.computes_workers[each.key].access_ip_v4
  protocol_port = 443
}

resource "openstack_lb_member_v2" "members_9000" {
  for_each      = var.computes_workers
  name          = each.key
  pool_id       = openstack_lb_pool_v2.pool_9000.id
  subnet_id     = openstack_networking_subnet_v2.subnet_bastion.id
  address       = openstack_compute_instance_v2.computes_workers[each.key].access_ip_v4
  protocol_port = 9000
}
