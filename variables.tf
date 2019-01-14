###
# General variables (these are used across multiple module's resources - DRY
###
variable "project_id" {
  type        = "string"
  description = "GCP project ID to spin this cluster in"
}

variable "service_account_id" {
  type        = "string"
  description = "The service account to be used by the Node VM."
}

variable "cluster_autoscaling" {
  description = "Wether or not to autoscale this cluster"
  type        = "string"
  default     = "true"
}

variable "cluster" {
  description = "GKE cluster to attach this node pool to's name"
  type        = "string"
}

variable "cluster_region" {
  type        = "string"
  description = "GCP region to create the node pool in"
  default     = "us-central1"
}

###
# GKE Node pool specific variables
###

variable "node_pool_name" {
  type        = "string"
  description = "Node pool name"
  default     = "node-pool"
}

variable "initial_node_pool_count" {
  type        = "string"
  description = "Initial node pool size - It'll create this many replicas on each AZ"
  default     = "2"
}

variable "node_pool_autoscaling_settings" {
  type        = "map"
  description = "Node pool's auto scaling settings"

  default = {
    min_node_count = "2"
    max_node_count = "10"
  }
}

variable "node_pool_management_settings" {
  type        = "map"
  description = "Node pool's management settings"

  default = {
    auto_repair  = "true"
    auto_upgrade = "true"
  }
}

variable "node_pool_machine_type" {
  type        = "string"
  description = "Instance type this node pool will use"
  default     = "n1-standard-1"
}

variable "node_pool_boot_disk_size" {
  type        = "string"
  description = "Node pool'sn node boot disk size (In GB's)"
  default     = "128"
}

variable "node_pool_boot_disk_type" {
  type        = "string"
  description = "Node pool'sn node boot disk type"

  # Values can be:
  # pd-ssd
  # pd-standard
  default = "pd-ssd"
}

variable "node_pool_oauth_scopes" {
  type        = "list"
  description = "The set of Google API scopes to be made available on all of the node VMs under the default service account"

  default = [
    "compute-rw",
    "storage-ro",
    "logging-write",
    "monitoring",
  ]
}

variable "node_pool_preemptible_flag" {
  type        = "string"
  description = "Wether or not this node pool is composed of preemptible instances"
  default     = "false"
}
