resource "openstack_lb_monitor_v2" "monitor_80" {
  name        = "Monitor-80"
  pool_id     = openstack_lb_pool_v2.pool_80.id
  type        = "TCP"
  delay       = 5
  timeout     = 5
  max_retries = 3
}

resource "openstack_lb_monitor_v2" "monitor_443" {
  name        = "Monitor-443"
  pool_id     = openstack_lb_pool_v2.pool_443.id
  type        = "TCP"
  delay       = 5
  timeout     = 5
  max_retries = 3
}

resource "openstack_lb_monitor_v2" "monitor_9000" {
  name        = "Monitor-9000"
  pool_id     = openstack_lb_pool_v2.pool_9000.id
  type        = "TCP"
  delay       = 5
  timeout     = 5
  max_retries = 3
}
