variable "openstack_user_name" {
    description = "The username for the Tenant."
    default  = "admin"
}

variable "openstack_tenant_name" {
    description = "The name of the Tenant."
    default  = "admin"
}

variable "openstack_password" {
    description = "The password for the Tenant."
    default  = "346f8720c8b15402dfc1a281a435571ce51bf4b6ebb7f27c659c1"
}

variable "openstack_auth_url" {
    description = "The endpoint url to connect to OpenStack."
    default  = "http://172.29.236.100:5000/v3"
}

variable "openstack_keypair" {
    description = "The keypair to be used."
    default  = "uros"
}

variable "openstack_image" {
    description = "The instance image to be used."
    default  = "bionic-server-cloudimg-amd64"
}

variable "openstack_flavor" {
    description = "The instance flavor to be used."
    default  = "medium"
}

variable "openstack_region" {
    description = "The region to be used."
    default  = "RegionOne"
}

variable "baremetal_network" {
    description = "Openstack external network."
    default  = "ironic_net"
}

variable "ironic_nodes" {
    description = "Define map of ironic nodes using ironic name and its uuid"
    type = "map"
    default = {
        "ironic1"  = "cb3148d1-b8c7-4659-80c8-2bb3d285f24b"
        "ironic2"  = "92c28aa4-94d6-4b5e-9892-69cb21ff0551"
        "ironic3"  = "1c0d5d16-e352-4215-8609-5ad864f2abff" 
        "ironic4"  = "eaf92103-f6df-454a-a07e-164f8113f022"
    }
}
