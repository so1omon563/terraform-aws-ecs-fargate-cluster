# Basic usage

Basic quickstart for creating a FARGATE ECS cluster.

Example shows using Default Tags in the provider as well as passing additional tags into the resource.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Examples

```hcl
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
```

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_fargate-cluster"></a> [fargate-cluster](#module\_fargate-cluster) | so1omon563/ecs-fargate-cluster/aws | 1.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
