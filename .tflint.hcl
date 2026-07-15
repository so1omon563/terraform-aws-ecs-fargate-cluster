tflint {
  required_version = ">= 0.63.0"
}

# Examples and test fixtures intentionally inherit compatibility from the module.
rule "terraform_required_providers" {
  enabled = false
}

rule "terraform_required_version" {
  enabled = false
}

rule "terraform_typed_variables" {
  enabled = false
}
