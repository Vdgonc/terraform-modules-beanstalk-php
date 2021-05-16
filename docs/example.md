# Example:

```hcl
provider "aws" {
    region = local.region
}


module "application" {
    source = ""

    app_name = "teste-app"
    service_name = "teste-app"
    service_desc = "teste-app"
    service_dns = "app-test.dev.example.com"
    instance_type = "t3.nano"
    min_instances = "2"
    max_instances = "2"
    key_pair_active = true
    key_pair = "vdgonc-key"

    document_root = "/public"

    healthcheck_url = "/check.php"

    environment_vars = [{
        name = "teste_var"
        value = "teste_value1"
    }]
}

output "name" {
    value = module.application.env_name
}

output "cname" {
    value = module.application.env_cname
}


output "env_autoscaling_groups" {
    value = module.application.env_autoscaling_groups
}

output "env_instances" {
    value = module.application.env_instances
}

output "env_load_balancers" {
    value = module.application.env_load_balancers
}

output "env_triggers" {
    value = module.application.env_triggers
}

output "env_endpoint_url" {
    value = module.application.env_endpoint_url
}
```