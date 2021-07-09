resource "openstack_compute_keypair_v2" "public_key" {
  name       = var.key_name
  public_key = file("linkedinkey.pub")
}