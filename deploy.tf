terraform {
  required_version = ">= 0.11.0"
}


data "template_file" "ironic_json" {
  for_each    = "${var.ironic_nodes}"
  template = "${file("${path.module}/dataset.json")}"

  vars = {
    hostname = "${each.key}"
  }
}


resource "openstack_compute_instance_v2" "ironic_node_instance" {
  name            = "zbi-${each.key}"
  image_id        = "${data.openstack_images_image_v2.openstack_image.id}"
  flavor_id       = "${data.openstack_compute_flavor_v2.openstack_flavor.id}"
  key_pair        = "${var.openstack_keypair}"
  for_each           = "${var.ironic_nodes}"

  availability_zone = "nova::${each.value}"
  config_drive = true
  personality {
    file = "/var/dataset/dataset.json"
    content = "${data.template_file.ironic_json[each.key].rendered}"
  }

  metadata = {
    group = "ironic_nodes"
    groups = "ironic_nodes"
  }

  network {
     name = "${data.openstack_networking_network_v2.baremetal_network.name}"
  }
}

