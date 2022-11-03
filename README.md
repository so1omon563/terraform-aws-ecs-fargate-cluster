# Fargate ECS Cluster

Build a Fargate ECS cluster and related resources. The options here are designed specifically with Fargate in mind, and are not designed to work with EC2 instances.

This module enables Container Insights by default, and creates a log group for them named `/aws/ecs/containerinsights/$CLUSTER_NAME/performance`
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Auto-generated technical documentation is created using [`terraform-docs`](https://terraform-docs.io/)

## Examples

```hcl
# See examples under the top level examples directory for more information on how to use this module.
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.38 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.37.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.container_insights](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.providers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_providers"></a> [capacity\_providers](#input\_capacity\_providers) | A list of capacity providers to enable on the ECS cluster. | `list(string)` | <pre>[<br>  "FARGATE",<br>  "FARGATE_SPOT"<br>]</pre> | no |
| <a name="input_cluster_name_override"></a> [cluster\_name\_override](#input\_cluster\_name\_override) | Used if there is a need to specify a cluster name outside of the standardized nomenclature. For example, if importing a cluster that doesn't follow the standard naming formats. | `string` | `null` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | One word descriptive type - A unique identifier to be appended to the `name` variable to name the resources. | `string` | `null` | no |
| <a name="input_container_insights"></a> [container\_insights](#input\_container\_insights) | Can be either `enabled` or `disabled`. If `enabled`, the ECS cluster will be configured to use Container Insights | `string` | `"enabled"` | no |
| <a name="input_container_insights_log_kms_key_id"></a> [container\_insights\_log\_kms\_key\_id](#input\_container\_insights\_log\_kms\_key\_id) | If `var.container_insights` is `enabled`, this is the KMS key ID of the specific Customer Managed Key you wish to use for encrypting logs. If not provided, the default CloudWatch encryption is used. | `number` | `null` | no |
| <a name="input_container_insights_log_retention_days"></a> [container\_insights\_log\_retention\_days](#input\_container\_insights\_log\_retention\_days) | If `var.container_insights` is `enabled`, this is the time (in days) for how long to keep container insights logs. | `number` | `365` | no |
| <a name="input_default_capacity_provider_strategy"></a> [default\_capacity\_provider\_strategy](#input\_default\_capacity\_provider\_strategy) | Optional set of capacity provider strategies to use by default for the cluster.<br>  Note that only one capacity provider can have a base defined.<br>  Any others must supply a `null` value, as shown in the example below.<br><br>  Example:<pre>[<br>    {<br>      base              = 1<br>      weight            = 75<br>      capacity_provider = "FARGATE"<br>    },<br>    {<br>      base              = null<br>      weight            = 25<br>      capacity_provider = "FARGATE_SPOT"<br>    }<br>  ]</pre> | `list(map(string))` | `[]` | no |
| <a name="input_execute_command_configuration"></a> [execute\_command\_configuration](#input\_execute\_command\_configuration) | The details of the execute command configuration. If `logging` is set to `OVERRIDE`, you must also provide values for the `log_configuration` variable.<br><br>  All values are required if using this variable, even if that value is `null`.<br><br>  See the Terraform documentation for [`execute_command_configuration` in the `aws_ecs_cluster` resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster#configuration) for more information on the available options. | <pre>object({<br>    kms_key_id = string<br>    logging    = string<br>  })</pre> | `null` | no |
| <a name="input_log_configuration"></a> [log\_configuration](#input\_log\_configuration) | Optional set of log configuration options to use for with `execute_command_configuration`. Required if `logging` is set to `OVERRIDE`.<br><br>  All values are required if using this variable, even if that value is `null`.<br><br>  See the Terraform documentation for [`log_configuration` in the `aws_ecs_cluster` resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster#configuration) for more information on the available options. | <pre>object({<br>    cloud_watch_encryption_enabled = bool<br>    cloud_watch_log_group_name     = string<br>    s3_bucket_name                 = string<br>    s3_bucket_encryption_enabled   = bool<br>    s3_key_prefix                  = string<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Short, descriptive name of the environment. All resources will be named using this value as a prefix. This or `cluster_name_override` must be set. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | A collection of all outputs from the ECS cluster. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the ECS cluster created by this module. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the ECS cluster created by this module. |
| <a name="output_container_insights"></a> [container\_insights](#output\_container\_insights) | A collection of all outputs from the Container Insights Log Group. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
