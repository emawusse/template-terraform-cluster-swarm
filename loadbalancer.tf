#Configuration du LB
resource "openstack_lb_loadbalancer_v2" "lb" {
  name          = var.loadbalancer_name
  vip_subnet_id = openstack_networking_subnet_v2.subnet_swarm.id
}

#Configuration de l'adresse ip floattante pour le LB
resource "openstack_networking_floatingip_v2" "floatip_lb" {
  pool = var.external_net
}

resource "openstack_networking_floatingip_associate_v2" "associate_floatip_lb" {
  floating_ip = openstack_networking_floatingip_v2.floatip_lb.address
  port_id     = openstack_lb_loadbalancer_v2.lb.vip_port_id
}

#Trafic sortant du LB vers les apps
resource "openstack_networking_secgroup_rule_v2" "lb" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_ip_prefix  = "10.0.20.0/0"
  security_group_id = openstack_compute_secgroup_v2.secgroup_swarm.id
}
