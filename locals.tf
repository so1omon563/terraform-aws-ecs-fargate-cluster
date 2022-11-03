locals {
  tags         = var.tags
  cluster_name = lower(var.cluster_name_override != null ? var.cluster_name_override : var.cluster_type == null ? var.name : format("%s-%s", var.name, var.cluster_type))

  # Used to dynamically generate blocks in the cluster resource
  configuration     = var.execute_command_configuration != null ? { execute_command = "ignore" } : {}
  log_configuration = var.log_configuration != null ? { log_configuration = "ignore" } : {}
}
