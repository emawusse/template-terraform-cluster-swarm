#Block Storage Workers
resource "openstack_blockstorage_volume_v2" "glusterfs_workers" {
  count = var.nbre_workers
  name  = var.workers_name[count.index]
  size  = var.size_glusterfs_workers
}

resource "openstack_compute_volume_attach_v2" "attach_glusterfs_workers" {
  count       = var.nbre_workers
  instance_id = openstack_compute_instance_v2.compute_workers.*.id[count.index]
  volume_id   = openstack_blockstorage_volume_v2.glusterfs_workers.*.id[count.index]
}

