resource "aws_ecs_cluster" "cluster" {
  name = local.cluster_name

  setting {
    name  = "containerInsights"
    value = var.container_insights
  }

  dynamic "configuration" {
    for_each = local.configuration

    content {
      execute_command_configuration {
        kms_key_id = var.execute_command_configuration.kms_key_id
        logging    = var.execute_command_configuration.logging

        dynamic "log_configuration" {
          for_each = local.log_configuration
          content {
            cloud_watch_encryption_enabled = var.log_configuration.cloud_watch_encryption_enabled
            cloud_watch_log_group_name     = var.log_configuration.cloud_watch_log_group_name
            s3_bucket_name                 = var.log_configuration.s3_bucket_name
            s3_bucket_encryption_enabled   = var.log_configuration.s3_bucket_encryption_enabled
            s3_key_prefix                  = var.log_configuration.s3_key_prefix
          }
        }
      }
    }
  }

  tags = merge(local.tags,
    {
      "Name" = local.cluster_name
    }
  )

}
