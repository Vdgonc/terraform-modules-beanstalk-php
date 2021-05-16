provider "aws" {
    region = local.region
}


data "aws_vpc" "vpc" {
    id = local.vpc
}

data "aws_subnet_ids" "subnets_id" {
    vpc_id = data.aws_vpc.vpc.id
    filter {
        name = "tag:Public"
        values = ["true"]
    }

}

data "aws_subnet" "subnets" {
    for_each = data.aws_subnet_ids.subnets_id.ids
    id       = each.value
}

data "aws_route53_zone" "selected" {
    name = local.zone_id
}