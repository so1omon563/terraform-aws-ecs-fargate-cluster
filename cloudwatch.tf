resource "aws_cloudwatch_log_group" "container_insights" {
  count             = var.container_insights == "enabled" ? 1 : 0
  name              = format("/aws/ecs/containerinsights/%s/performance", local.cluster_name)
  retention_in_days = var.container_insights_log_retention_days
  kms_key_id        = var.container_insights_log_kms_key_id
  tags = merge(local.tags,
    {
      "Name" = format("%s-container-insights", local.cluster_name)
    }
  )
}
