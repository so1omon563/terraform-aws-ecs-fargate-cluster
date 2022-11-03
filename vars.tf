
variable "capacity_providers" {
  description = "A list of capacity providers to enable on the ECS cluster."
  type        = list(string)
  default     = ["FARGATE", "FARGATE_SPOT"]
}

variable "cluster_name_override" {
  type        = string
  description = "Used if there is a need to specify a cluster name outside of the standardized nomenclature. For example, if importing a cluster that doesn't follow the standard naming formats."
  default     = null
}

variable "cluster_type" {
  type        = string
  description = "One word descriptive type - A unique identifier to be appended to the `name` variable to name the resources."
  default     = null
}

variable "container_insights" {
  type        = string
  description = "Can be either `enabled` or `disabled`. If `enabled`, the ECS cluster will be configured to use Container Insights"
  default     = "enabled"

  validation {
    condition = contains([
      "enabled",
      "disabled",
    ], var.container_insights)
    error_message = "Valid values are limited to (enabled,disabled)."
  }
}

variable "container_insights_log_kms_key_id" {
  type        = number
  description = "If `var.container_insights` is `enabled`, this is the KMS key ID of the specific Customer Managed Key you wish to use for encrypting logs. If not provided, the default CloudWatch encryption is used."
  default     = null
}

variable "container_insights_log_retention_days" {
  type        = number
  description = "If `var.container_insights` is `enabled`, this is the time (in days) for how long to keep container insights logs."
  default     = 365
}

variable "default_capacity_provider_strategy" {
  description = <<EOT
  Optional set of capacity provider strategies to use by default for the cluster.
  Note that only one capacity provider can have a base defined.
  Any others must supply a `null` value, as shown in the example below.

  Example:
```
  [
    {
      base              = 1
      weight            = 75
      capacity_provider = "FARGATE"
    },
    {
      base              = null
      weight            = 25
      capacity_provider = "FARGATE_SPOT"
    }
  ]
```
  EOT
  type        = list(map(string))
  default     = []
}

variable "execute_command_configuration" {
  type = object({
    kms_key_id = string
    logging    = string
  })
  description = <<EOT

  The details of the execute command configuration. If `logging` is set to `OVERRIDE`, you must also provide values for the `log_configuration` variable.

  All values are required if using this variable, even if that value is `null`.

  See the Terraform documentation for [`execute_command_configuration` in the `aws_ecs_cluster` resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster#configuration) for more information on the available options.
  EOT
  default     = null
}

variable "log_configuration" {
  type = object({
    cloud_watch_encryption_enabled = bool
    cloud_watch_log_group_name     = string
    s3_bucket_name                 = string
    s3_bucket_encryption_enabled   = bool
    s3_key_prefix                  = string
  })
  description = <<EOT

  Optional set of log configuration options to use for with `execute_command_configuration`. Required if `logging` is set to `OVERRIDE`.

  All values are required if using this variable, even if that value is `null`.

  See the Terraform documentation for [`log_configuration` in the `aws_ecs_cluster` resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster#configuration) for more information on the available options.
  EOT
  default     = null
}

variable "name" {
  type        = string
  description = "Short, descriptive name of the environment. All resources will be named using this value as a prefix. This or `cluster_name_override` must be set."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider."
  default     = {}
}
