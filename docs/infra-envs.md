# Infra Variables
---


Name: `service_name`

Description: The application name.

Default:

---

Name: `service_desc`

Description: The application description.

Default:

---

Name: `service_dns`

Description: The application url.

Default:

---

Name: `instance_type`

Description: The instance type.

Default: t3.micro

---

Name: `stack_name`

Description: The Elastic Beanstalk solution stack name.

Default: 64bit Amazon Linux 2018.03 v2.9.17 running PHP 7.3

---

Name: `volume_type`

Description: The ebs type.

Default: gp2

---

Name: `volume_size`

Description: The ebs size.

Default: "16"

---

Name: `key_pair_active`

Description: Allow key pair usage.

Default: false

---

Name: `key_pair`

Description: The key pair name.

Default:

---

Name: `min_instances`

Description: The minimum number of instances.

Default: "1"

---

Name: `max_instances`

Description: The maximum number of instances.

Default: "1"

---


Name: `port`

Description: The instance port.

Default: "80"

---

Name: `healthcheck_url`

Description: The path to which to send health check requests.

Default:

---

Name: `healthcheck_healthy_threshold`

Description: Consecutive successful requests before Elastic Load Balancing changes the instance health status.

Default: "3"

---

Name: `healthcheck_unhealthy_threshold`

Description: Consecutive unsuccessful requests before Elastic Load Balancing changes the instance health status.

Default: "5"

---

Name: `healthcheck_interval`

Description: The interval at which Elastic Load Balancing will check the health of your application's Amazon EC2 instances.

Default: "10"

---

Name: `healthcheck_timeout`

Description: Number of seconds Elastic Load Balancing will wait for a response before it considers the instance nonresponsive.

Default: "5"

---

Name: `alarm_5xx`

Description: HTTPCode_ELB_5XX_Count threshold.

Default: "30"

---

Name: `log_terminate`

Description: Terminate logstream when delete environment.

Default: true

---
