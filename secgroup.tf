resource "openstack_compute_secgroup_v2" "secgroup_bastion" {
  name        = var.secgroup_bastion_name
  description = "GROUPE DE SECURITE DU BASTION"
}

#ssh a partir du bastion vers les managers
resource "openstack_networking_secgroup_rule_v2" "ssh_all_bastion" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_compute_secgroup_v2.secgroup_bastion.id
}

resource "openstack_compute_secgroup_v2" "secgroup_swarm" {
  name        = var.secgroup_swarm_name
  description = "GROUPE DE SECURITE DES NOEUDS SWARM"
}

#ssh a partir du bastion vers les managers
resource "openstack_networking_secgroup_rule_v2" "ssh_bastion_swarm" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_group_id   = openstack_compute_secgroup_v2.secgroup_bastion.id
  security_group_id = openstack_compute_secgroup_v2.secgroup_swarm.id
}

#tcp entre les instances managers
resource "openstack_networking_secgroup_rule_v2" "all_tcp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_group_id   = openstack_compute_secgroup_v2.secgroup_swarm.id
  security_group_id = openstack_compute_secgroup_v2.secgroup_swarm.id
}

#tcp entre les instances managers
resource "openstack_networking_secgroup_rule_v2" "all_udp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_group_id   = openstack_compute_secgroup_v2.secgroup_swarm.id
  security_group_id = openstack_compute_secgroup_v2.secgroup_swarm.id
}

#ping entre les instances managers
resource "openstack_networking_secgroup_rule_v2" "all_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  port_range_min    = 0
  port_range_max    = 0
  remote_group_id   = openstack_compute_secgroup_v2.secgroup_swarm.id
  security_group_id = openstack_compute_secgroup_v2.secgroup_swarm.id
}

#ping depuis le bastion vers les managers
resource "openstack_networking_secgroup_rule_v2" "bastion_ping" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  port_range_min    = 0
  port_range_max    = 0
  remote_group_id   = openstack_compute_secgroup_v2.secgroup_bastion.id
  security_group_id = openstack_compute_secgroup_v2.secgroup_swarm.id
}

#Affichage de Portainer depuis le web sur le port 9000
resource "openstack_networking_secgroup_rule_v2" "portainer" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9000
  port_range_max    = 9000
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_compute_secgroup_v2.secgroup_swarm.id
}

#Port http pour internet depuis tout le monde
resource "openstack_networking_secgroup_rule_v2" "all_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_compute_secgroup_v2.secgroup_swarm.id
}

#Port https pour internet depuis tout le monde
resource "openstack_networking_secgroup_rule_v2" "all_https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_compute_secgroup_v2.secgroup_swarm.id
}

#Affichage de traefik depuis le web sur le port 8080
resource "openstack_networking_secgroup_rule_v2" "traefik_dashboard" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8080
  port_range_max    = 8080
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_compute_secgroup_v2.secgroup_swarm.id
}

#Affichage d'adminer depuis le web sur le port 9090
resource "openstack_networking_secgroup_rule_v2" "adminer_dashboard" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9090
  port_range_max    = 9090
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_compute_secgroup_v2.secgroup_swarm.id
}

#Regle pour permettre au loadbalancer de communiquer avec le reseau des instances
resource "openstack_networking_secgroup_rule_v2" "lb_managers" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_ip_prefix  = "10.0.20.0/24"
  security_group_id = openstack_compute_secgroup_v2.secgroup_swarm.id
}