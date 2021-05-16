resource "aws_elastic_beanstalk_application" "application" {
    name = var.service_name
    description = var.service_desc
}


resource "aws_elastic_beanstalk_environment" "environment" {
    name = var.service_name
    application = aws_elastic_beanstalk_application.application.name
    solution_stack_name = var.stack_name

    # instance settings - aws:autoscaling:launchconfiguration

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "InstanceType"
        value = var.instance_type
    }

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "RootVolumeType"
        value = var.volume_type
    }

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "RootVolumeSize"
        value = var.volume_size
    }

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "EC2KeyName"
        value = local.keypair
    }

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "SecurityGroups"
        value = aws_security_group.allow_trafic.id
    }

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "IamInstanceProfile"
        value = aws_iam_instance_profile.beanstalk_ec2.name
    }

    setting {
        namespace = "aws:elasticbeanstalk:environment"
        name = "ServiceRole"
        value = aws_iam_role.beanstalk_service.name
    }

    setting {
        namespace = "aws:elasticbeanstalk:sns:topics"
        name = "Notification Topic ARN"
        value = aws_sns_topic.notification_topic.arn
    }

    # network config - aws:ec2:vpc
    setting {
        namespace = "aws:ec2:vpc"
        name = "VPCId"
        value = local.vpc
    }

    setting {
        namespace = "aws:ec2:vpc"
        name = "Subnets"
        value = join(",", data.aws_subnet_ids.subnets_id.ids)
    }

    setting {
        namespace = "aws:ec2:vpc"
        name = "AssociatePublicIpAddress"
        value = "true"
    }
        

    # loadbalancer config
    setting {
        namespace = "aws:elasticbeanstalk:environment"
        name = "LoadBalancerType"
        value = "application"
    }

    setting {
        namespace = "aws:ec2:vpc"
        name = "ELBSubnets"
        value = join(",", data.aws_subnet_ids.subnets_id.ids)
    }

    # autoscaling config - aws:autoscaling:asg
    setting {
        namespace = "aws:autoscaling:asg"
        name = "MinSize"
        value = var.min_instances
    }

    setting {
        namespace = "aws:autoscaling:asg"
        name = "MaxSize"
        value = var.max_instances
    }

    # loadbalancer config - aws:elbv2:listener:80

    setting {
        namespace = "aws:elbv2:listener:80"
        name = "ListenerEnabled"
        value = "true"
    }

    # loadbalancer config - aws:elbv2:listener:443

    setting {
        namespace = "aws:elbv2:listener:443"
        name = "Protocol"
        value = "HTTPS"
    }

    setting {
        namespace = "aws:elbv2:listener:443"
        name = "SSLCertificateArns"
        value = aws_acm_certificate.cert.arn
    }

    setting {
        namespace = "aws:elbv2:listener:443"
        name = "ListenerEnabled"
        value = "true"
    }

    # healthcheck
    setting {
        namespace = "aws:elasticbeanstalk:environment:process:default"
        name = "HealthCheckPath"
        value = var.healthcheck_url
    }

    setting {
        namespace = "aws:elb:healthcheck"
        name = "HealthyThreshold"
        value = var.healthcheck_healthy_threshold
    }

    setting {
        namespace = "aws:elb:healthcheck"
        name = "UnhealthyThreshold"
        value = var.healthcheck_unhealthy_threshold
    }

    setting {
        namespace = "aws:elb:healthcheck"
        name = "Interval"
        value = var.healthcheck_interval
    }

    setting {
        namespace = "aws:elb:healthcheck"
        name = "Timeout"
        value = var.healthcheck_timeout
    }

    # php.ini config - aws:elasticbeanstalk:container:php:phpini
    setting {
        namespace = "aws:elasticbeanstalk:container:php:phpini"
        name = "document_root"
        value = var.document_root
    }

    setting {
        namespace = "aws:elasticbeanstalk:container:php:phpini"
        name = "memory_limit"
        value = var.memory_limit
    }

    setting {
        namespace = "aws:elasticbeanstalk:container:php:phpini"
        name = "zlib.output_compression"
        value = var.zlib_php_compression
    }

    setting {
        namespace = "aws:elasticbeanstalk:container:php:phpini"
        name = "allow_url_fopen"
        value = var.allow_url_fopen
    }

    setting {
        namespace = "aws:elasticbeanstalk:container:php:phpini"
        name = "display_errors"
        value = var.display_errors
    }

    setting {
        namespace = "aws:elasticbeanstalk:container:php:phpini"
        name = "max_execution_time"
        value = var.max_execution_time
    }

    setting {
        namespace = "aws:elasticbeanstalk:container:php:phpini"
        name = "composer_options"
        value = var.max_execution_time
    }

    # autostcaling trigger - aws:autoscaling:trigger

    setting {
        namespace = "aws:autoscaling:trigger"
        name = "MeasureName"
        value = var.trigger_name
    }

    setting {
        namespace = "aws:autoscaling:trigger"
        name = "Unit"
        value = "Percent"
    }

    setting {
        namespace = "aws:autoscaling:trigger"
        name = "BreachDuration"
        value = "3"
    }

    setting {
        namespace = "aws:autoscaling:trigger"
        name = "EvaluationPeriods"
        value = "1"
    }

    setting {
        namespace = "aws:autoscaling:trigger"
        name = "UpperBreachScaleIncrement"
        value = "1"
    }

    setting {
        namespace = "aws:autoscaling:trigger"
        name = "LowerBreachScaleIncrement"
        value = "-1"
    }

    setting {
        namespace = "aws:autoscaling:trigger"
        name = "LowerThreshold"
        value = "80"
    }
    
    setting {
        namespace = "aws:autoscaling:trigger"
        name = "UpperThreshold"
        value = "80"
    }

    # cloudwatch options - aws:elasticbeanstalk:cloudwatch:logs

    setting {
        namespace = "aws:elasticbeanstalk:cloudwatch:logs"
        name = "StreamLogs"
        value = true
    }

    setting {
        namespace = "aws:elasticbeanstalk:cloudwatch:logs"
        name = "RetentionInDays"
        value = 60
    }

    setting {
        namespace = "aws:elasticbeanstalk:cloudwatch:logs"
        name = "DeleteOnTerminate"
        value = var.log_terminate
    }

    # env vars - aws:elasticbeanstalk:application:environment
    dynamic "setting" {
        for_each = var.environment_vars
        content {
            namespace = "aws:elasticbeanstalk:application:environment"
            name = setting.value["name"]
            value = setting.value["value"]
        }
    }
}