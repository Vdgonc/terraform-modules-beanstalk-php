resource "aws_security_group" "allow_trafic" {
    name = join("_", [var.service_name, "sg"])
    vpc_id = local.vpc

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = join("_", [var.service_name, "sg"])
    }
}

resource "aws_security_group_rule" "ingress_rules" {
    type = "ingress"
    security_group_id = aws_security_group.allow_trafic.id

    for_each = { for index, rules in var.security_group_rules : index => rules }
    from_port = each.value.from_port
    to_port = each.value.to_port
    protocol = each.value.protocol
    cidr_blocks = each.value.cidr_blocks
}