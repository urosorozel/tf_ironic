## Provision Openstack baremetal with Terraform

1. Initialize Terraform

```
$ terraform init
```

2. Modify variables.tfvars

```
openstack_user_name = "username"
openstack_tenant_name = "project_name"
openstack_password = "password"
openstack_auth_url = "https://cloud1a.example.net:5000/v3"
openstack_keypair = "keypair_name"
openstack_image = "image_name"
openstack_flavor = "my-baremetal-flavor"
openstack_region = "RegionOne"
baremetal_network = "network_name"
# List of ironic nodes and their UUID
ironic_nodes = {
    "baremetal1_name"  = "cb3148d1-b8c7-4659-80c8-2bb3d285f24b"
    "baremetal2_name"  = "92c28aa4-94d6-4b5e-9892-69cb21ff0551"
    "baremetal3_name"  = "1c0d5d16-e352-4215-8609-5ad864f2abff"
    "baremetal4_name"  = "eaf92103-f6df-454a-a07e-164f8113f022"
}
```

3. Execute Terraform plan

```
$ terraform  plan -var-file variables.tfvars
```

4. Execute Terraform apply

```
terraform  apply  -var-file variables.tfvars
```
