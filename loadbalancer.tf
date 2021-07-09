resource "openstack_lb_loadbalancer_v2" "loadbalancer" {
  name          = var.loadbalancer_name
  vip_subnet_id = openstack_networking_subnet_v2.subnet_swarm.id
}

resource "openstack_lb_listener_v2" "listener_80" {
  name            = "Listener-80"
  protocol        = "TCP"
  protocol_port   = 80
  loadbalancer_id = openstack_lb_loadbalancer_v2.loadbalancer.id
}

resource "openstack_lb_pool_v2" "pool_80" {
  name        = "Pool-80"
  protocol    = "TCP"
  lb_method   = "SOURCE_IP"
  listener_id = openstack_lb_listener_v2.listener_80.id
}

resource "openstack_lb_monitor_v2" "monitor_80" {
  name        = "Monitor-80"
  pool_id     = openstack_lb_pool_v2.pool_80.id
  type        = "PING"
  delay       = 5
  timeout     = 5
  max_retries = 3
}

resource "openstack_lb_member_v2" "members_workers_80" {
  count         = var.nbre_workers
  name          = var.workers_name[count.index]
  pool_id       = openstack_lb_pool_v2.pool_80.id
  subnet_id     = openstack_networking_subnet_v2.subnet_swarm.id
  address       = openstack_compute_instance_v2.compute_workers.*.access_ip_v4[count.index]
  protocol_port = 80
}

resource "openstack_lb_listener_v2" "listener_443" {
  name            = "Listener-443"
  protocol        = "TCP"
  protocol_port   = 443
  loadbalancer_id = openstack_lb_loadbalancer_v2.loadbalancer.id
}

resource "openstack_lb_pool_v2" "pool_443" {
  name        = "Pool-443"
  protocol    = "TCP"
  lb_method   = "SOURCE_IP"
  listener_id = openstack_lb_listener_v2.listener_443.id
}

resource "openstack_lb_monitor_v2" "monitor_443" {
  name        = "Monitor-443"
  pool_id     = openstack_lb_pool_v2.pool_443.id
  type        = "PING"
  delay       = 5
  timeout     = 5
  max_retries = 3
}

resource "openstack_lb_member_v2" "members_443" {
  count         = var.nbre_workers
  name          = var.workers_name[count.index]
  pool_id       = openstack_lb_pool_v2.pool_443.id
  subnet_id     = openstack_networking_subnet_v2.subnet_swarm.id
  address       = openstack_compute_instance_v2.compute_workers.*.access_ip_v4[count.index]
  protocol_port = 443
}
