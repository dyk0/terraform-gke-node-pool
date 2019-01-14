resource "google_container_node_pool" "primary" {
  name               = "${var.node_pool_name}"
  region             = "${var.cluster_region}"
  cluster            = "${var.cluster}"
  project            = "${var.project_id}"
  initial_node_count = "${var.initial_node_pool_count}"
  autoscaling        = ["${var.node_pool_autoscaling_settings}"]
  management         = ["${var.node_pool_management_settings}"]

  node_config {
    preemptible     = "${var.node_pool_preemptible_flag}"
    machine_type    = "${var.node_pool_machine_type}"
    service_account = "${data.google_service_account.primary.email}"
    disk_size_gb    = "${var.node_pool_boot_disk_size}"
    disk_type       = "${var.node_pool_boot_disk_type}"
    oauth_scopes    = ["${var.node_pool_oauth_scopes}"]
  }
}
