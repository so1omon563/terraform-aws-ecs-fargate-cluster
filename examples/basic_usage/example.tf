provider "aws" {
  default_tags {
    tags = {
      environment = "dev"
      terraform   = "true"
    }
  }
}

module "fargate-cluster" {
  #checkov:skip=CKV_AWS_224: "Ensure Cluster logging with CMK" - For this example, this is not required
  source  = "so1omon563/ecs-fargate-cluster/aws"
  version = "1.0.0" # Ensure this is the latest version for your needs

  name = "example-cluster"
  tags = {
    example = "true"
  }
}
