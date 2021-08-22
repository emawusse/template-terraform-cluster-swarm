resource "openstack_lb_listener_v2" "listener_80" {
  name            = "listener_80"
  protocol        = "TCP"
  protocol_port   = 80
  loadbalancer_id = openstack_lb_loadbalancer_v2.lb.id
}

resource "openstack_lb_listener_v2" "listener_443" {
  name            = "listener_443"
  protocol        = "TCP"
  protocol_port   = 443
  loadbalancer_id = openstack_lb_loadbalancer_v2.lb.id
}

resource "openstack_lb_listener_v2" "listener_9000" {
  name            = "listener_9000"
  protocol        = "TCP"
  protocol_port   = 9000
  loadbalancer_id = openstack_lb_loadbalancer_v2.lb.id
}
