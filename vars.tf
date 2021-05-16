variable "service_name" {
    type = string
    description = "The application name"
}

variable "service_desc" {
    type = string
    description = "The application description"
}

variable "service_dns" {
    type = string
    description = "The application url"
}

variable "instance_type" {
    type = string
    description = "The instance type"
    default = "t3.micro"
}

variable "security_group_rules" {
    type = list(object({
        description = string
        from_port = number
        to_port = number
        protocol = string
        cidr_blocks = list(string)
    }))
    description = "The rules of security group"
    default = [
        {
            description = "SSH"
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["172.32.0.0/16"]
        },
        {
            description = "HTTP"
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            description = "HTTPS"
            from_port   = 443
            to_port     = 443
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}

variable "stack_name" {
    type = string
    description = "The Elastic Beanstalk solution stack name"
    default = "64bit Amazon Linux 2018.03 v2.9.17 running PHP 7.3"
}


variable "volume_type" {
    type = string
    description = "The ebs type"
    default = "gp2"
}

variable "volume_size" {
    type = string
    description = "The ebs size"
    default = "16"
}

variable "key_pair_active" {
    type = bool
    description = "Allow key pair use"
    default = false
}

variable "key_pair" {
    type = string
    description = "The key pair name"
}

variable "min_instances" {
    type = string
    description = "The minimum number of instances"
    default = "1"
}

variable "max_instances" {
    type = string
    description = "The maximum number of instances"
    default = "1"
}

variable "port" {
    type = string
    description = "The instance port"
    default = "80"
}

variable "healthcheck_url" {
    type = string
    description = "The path to which to send health check requests."
}

variable "healthcheck_healthy_threshold" {
    type = string
    description = "Consecutive successful requests before Elastic Load Balancing changes the instance health status."
    default = "3"
}

variable "healthcheck_unhealthy_threshold" {
    type = string
    description = "Consecutive unsuccessful requests before Elastic Load Balancing changes the instance health status."
    default = "5"
}

variable "healthcheck_interval" {
    type = string
    description = "The interval at which Elastic Load Balancing will check the health of your application's Amazon EC2 instances."
    default = "10"
}

variable "healthcheck_timeout" {
    type = string
    description = "Number of seconds Elastic Load Balancing will wait for a response before it considers the instance nonresponsive."
    default = "5"
}

variable "environment_vars" {
    type = list(object({name = string, value = string}))
    description = "The environment vars."
    default = []
}


variable "alarm_5xx" {
    type = string
    description = "HTTPCode_ELB_5XX_Count threshold."
    default = "20"
}

variable "alarm_4xx" {
    type = string
    description = "HTTPCode_ELB_4XX_Count threshold."
    default = "30"
}

variable "log_terminate" {
    type = bool
    description = "Terminate logstream when delete environment"
    default = true
}

variable "alarm_4xx_enable" {
    type = bool
    description = "Create 4xx alarm"
    default = false
}