module "vpc" {
  source     = "https://github.com/lucazz/terraform-gcp-network.git"
  project_id = "dope-project"
}

module "gke-test" {
  source             = "https://github.com/lucazz/terraform-gke.git"
  project_id         = "dope-project"
  service_account_id = "project-service-account"
  vpc_network        = "${module.vpc.vpc_network}"
  vpc_subnetwork     = "${module.vpc.vpc_subnetwork}"
}

module "gke-node-pool" {
  source             = "https://github.com/lucazz/terraform-gke-node-pool.git"
  project_id         = "dope-project"
  service_account_id = "project-service-account"
  cluster            = "${module.gke.cluster_name}"
}
