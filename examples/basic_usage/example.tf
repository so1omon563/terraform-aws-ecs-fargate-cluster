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

  source = "../../"

  name = "example-cluster"
  tags = {
    example = "true"
  }
}
