resource "openstack_lb_pool_v2" "pool_80" {
  name        = "Pool-80"
  protocol    = "TCP"
  lb_method   = "SOURCE_IP"
  listener_id = openstack_lb_listener_v2.listener_80.id
}

resource "openstack_lb_pool_v2" "pool_443" {
  name        = "Pool-443"
  protocol    = "TCP"
  lb_method   = "SOURCE_IP"
  listener_id = openstack_lb_listener_v2.listener_443.id
}

resource "openstack_lb_pool_v2" "pool_9000" {
  name        = "Pool-9000"
  protocol    = "TCP"
  lb_method   = "SOURCE_IP"
  listener_id = openstack_lb_listener_v2.listener_9000.id
}
