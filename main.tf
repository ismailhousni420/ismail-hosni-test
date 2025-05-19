terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}


provider "openstack" {
  cloud  = "osp_admin" 
}

resource "openstack_compute_instance_v2" "server" {
  name            = "Debian10"  
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id
  key_pair        = var.keypair
  security_groups = var.security_groups

  network {
    name = var.network
  }
}
