terraform {
  required_version = ">= 0.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.38"
    }
  }
}

variable "name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "cluster_name_override" {
  type = string
}

provider "aws" {
  default_tags {
    tags = var.tags
  }
}

module "fargate-cluster" {
  #checkov:skip=CKV_AWS_224: "Ensure Cluster logging with CMK" - For this example, this is not required
  source = "../../../"

  name = var.name
  tags = {
    example = "true"
  }
}
output "fargate-cluster" { value = module.fargate-cluster }

module "fargate-override-cluster" {
  #checkov:skip=CKV_AWS_224: "Ensure Cluster logging with CMK" - For this example, this is not required
  source = "../../../"

  name = var.cluster_name_override
  tags = {
    example = "true"
  }
}
output "fargate-override-cluster" { value = module.fargate-override-cluster }

#tfsec:ignore:aws-ecs-enable-container-insight - For this example, this is specifically disabled
module "fargate-insights-cluster" {
  #checkov:skip=CKV_AWS_224: "Ensure Cluster logging with CMK" - For this example, this is not required
  #checkov:skip=CKV_AWS_65: "Ensure container insights are enabled on ECS cluster" - For this example, this is specifically disabled

  source = "../../../"

  name               = format("%s-insights", var.name)
  container_insights = "disabled"
  tags = {
    example = "true"
  }
}
output "fargate-insights-cluster" { value = module.fargate-insights-cluster }
