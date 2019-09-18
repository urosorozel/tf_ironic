data "openstack_compute_flavor_v2" "openstack_flavor" {
  name = "my-baremetal-flavor"
  vcpus = 2
  ram   = 16384
}

data "openstack_images_image_v2" "openstack_image" {
  name = "bionic-server-cloudimg-amd64"
  most_recent = true
}

data "openstack_networking_network_v2" "baremetal_network" {
  name = "${var.baremetal_network}"
}
