resource "aws_sns_topic" "notification_topic" {
    name = join("-", [var.service_name, "notifiction-topic"])
}
resource "aws_cloudwatch_metric_alarm" "alarm_4xx" {
    count = var.alarm_4xx_enable ? 1 : 0
    alarm_name = join(": ", [var.service_name, "4XX Alarm"])
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = 1
    metric_name = "HTTPCode_Target_4XX_Count"
    namespace = "AWS/ApplicationELB"
    period = "180"
    statistic = "Average"
    threshold = var.alarm_4xx

    dimensions = {
        LoadBalancer = join("/", [split("/", aws_elastic_beanstalk_environment.environment.load_balancers[0])[1],split("/", aws_elastic_beanstalk_environment.environment.load_balancers[0])[2],split("/", aws_elastic_beanstalk_environment.environment.load_balancers[0])[3]] )
    }

    alarm_description = "This metric monitors number of 4xx erros in the application load balancer"

}
