resource "aws_route53_record" "dns" {
    zone_id = data.aws_route53_zone.selected.zone_id
    name = var.service_dns
    type = "CNAME"
    ttl = "300"
    records = [aws_elastic_beanstalk_environment.environment.cname]
}

resource "aws_acm_certificate" "cert" {
    domain_name = var.service_dns
    validation_method = "DNS"
}


resource "aws_route53_record" "validation" {
    zone_id = data.aws_route53_zone.selected.zone_id

    name = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_name
    type = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_type
    records = [tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_value]
    ttl = "60"
}

resource "aws_acm_certificate_validation" "cert_validation" {
    certificate_arn = aws_acm_certificate.cert.arn
    validation_record_fqdns = [aws_route53_record.validation.fqdn]
}
