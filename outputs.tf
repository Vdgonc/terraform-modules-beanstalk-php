output "env_name" {
    value = aws_elastic_beanstalk_environment.environment.name
}

output "env_cname" {
    value = aws_elastic_beanstalk_environment.environment.cname
}

output "env_setting" {
    value = aws_elastic_beanstalk_environment.environment.setting
}

output "env_autoscaling_groups" {
    value = aws_elastic_beanstalk_environment.environment.autoscaling_groups
}

output "env_instances" {
    value = aws_elastic_beanstalk_environment.environment.instances
}

output "env_load_balancers" {
    value = aws_elastic_beanstalk_environment.environment.load_balancers
}

output "env_triggers" {
    value = aws_elastic_beanstalk_environment.environment.triggers
}

output "env_endpoint_url" {
    value = aws_elastic_beanstalk_environment.environment.endpoint_url
}