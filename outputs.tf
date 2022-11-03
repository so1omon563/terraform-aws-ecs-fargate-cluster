output "cluster_id" {
  description = "The ID of the ECS cluster created by this module."
  value       = aws_ecs_cluster.cluster.id
}

output "cluster_name" {
  description = "The name of the ECS cluster created by this module."
  value       = aws_ecs_cluster.cluster.name
}

output "cluster" {
  description = "A collection of all outputs from the ECS cluster."
  value       = { for key, value in aws_ecs_cluster.cluster : key => value }
}

output "container_insights" {
  description = "A collection of all outputs from the Container Insights Log Group."
  value       = { for key, value in aws_cloudwatch_log_group.container_insights : key => value }
}
