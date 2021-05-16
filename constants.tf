variable "aws_region" {
    type = map(string)
    description = "AWS Region"
    default = {
        default = "us-east-2"
        prod = "us-east-1"
        staging = "us-east-2"
        dev = "us-east-2"
    }
}

variable "vpc" {
    type = map(string)
    description = "VPC ID"
    default = {
        default = "INSERT YOUR VCP ID"
        prod = "INSERT YOUR VCP ID"
        staging = "INSERT YOUR VCP ID"
        dev = "INSERT YOUR VCP ID"

    }
}

variable "zone_id" {
    type = map(string)
    description = "Route53 zone id"
    default = {
        default = "dev.example.com"
        prod = "example.com"
        staging = "stg.example.com"
        dev = "dev.example.com"
    }
}


variable "deployment_policy" {
    type    = string
    description = "The deployment policy"
    default = "Rolling"
}


variable "trigger_name" {
    type = string
    description = "Autoscaling Trigger"
    default = "CPUUtilization"
}