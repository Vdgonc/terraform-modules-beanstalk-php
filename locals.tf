locals {
    region = lookup(var.aws_region, terraform.workspace)
    vpc = lookup(var.vpc, terraform.workspace)
    zone_id = lookup(var.zone_id, terraform.workspace)
    keypair = var.key_pair_active ? var.key_pair : ""
}