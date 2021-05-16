# Terraform Module Beanstalk PHP
---
Provisioning your PHP apps with this Terraform Module.

###### This module was testing with PHP + Apache2

## Requiremnts
* VPC configured
* Your subnets must be taggeds with `Public: true` for public subnets
* Hosted Zones configured


## PHP Versions:
* Default version: `7.3`

* Default AMI: `64bit Amazon Linux 2018.03 v2.9.17 running PHP 7.3`


### Supported Stack Name

* `64bit Amazon Linux 2018.03 v2.9.17 running PHP 7.3`
* `64bit Amazon Linux 2018.03 v2.9.17 running PHP 7.2`


[Example](docs/example.md)

[PHP variables](docs/php-envs.md)

[Beanstalk variables](docs/infra-envs.md)


### Running the code

```bash
# apply in dev environmnet
# url: app-test.dev.example.com
$ terraform init
$ terraform workspace new dev
$ terraform plan
$ terrafrom apply

# apply in staging environmnet
# url: app-test.stg.example.com
$ terraform init
$ terraform workspace new staging
$ terraform plan
$ terrafrom apply

# apply in prod environmnet
# url: app-test.example.com
$ terraform init
$ terraform workspace new prod
$ terraform plan
$ terrafrom apply

```