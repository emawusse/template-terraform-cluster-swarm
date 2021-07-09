resource "openstack_networking_floatingip_v2" "floatip_bastion" {
  pool = "public"
}

resource "openstack_compute_floatingip_associate_v2" "associate_floatip_bastion" {
  floating_ip = openstack_networking_floatingip_v2.floatip_bastion.address
  instance_id = openstack_compute_instance_v2.compute_bastion.id
}

resource "openstack_networking_floatingip_v2" "floatip_lb" {
  pool = "public"
}

resource "openstack_networking_floatingip_associate_v2" "associate_floatip_lb" {
  floating_ip = openstack_networking_floatingip_v2.floatip_lb.address
  port_id     = openstack_lb_loadbalancer_v2.loadbalancer.vip_port_id

}