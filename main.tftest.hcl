mock_provider "aws" {}

run "default_cluster" {
  command = plan

  variables {
    name = "Example"
  }

  assert {
    condition     = aws_ecs_cluster.cluster.name == "example"
    error_message = "Cluster name should default to the lower-cased name variable."
  }

  assert {
    condition     = aws_cloudwatch_log_group.container_insights[0].retention_in_days == 365
    error_message = "Container Insights log retention should default to 365 days."
  }
}

run "cluster_name_override" {
  command = plan

  variables {
    name                  = "Example"
    cluster_name_override = "Explicit-Cluster"
  }

  assert {
    condition     = aws_ecs_cluster.cluster.name == "explicit-cluster"
    error_message = "Cluster name override should be lower-cased and used as the cluster name."
  }
}

run "container_insights_disabled" {
  command = plan

  variables {
    name               = "Example"
    container_insights = "disabled"
  }

  assert {
    condition     = length(aws_cloudwatch_log_group.container_insights) == 0
    error_message = "Container Insights log group should not be planned when disabled."
  }
}
