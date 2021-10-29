locals {
  node_pool_ingress_tag = "cluster-ingress"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "google_container_cluster" "cluster" {
  provider           = google-beta
  project            = var.project_id
  name               = "alephium-stack"
  min_master_version = "latest"

  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    # Disables basic auth
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  enable_legacy_abac = false

  workload_identity_config {
    identity_namespace = "${var.project_id}.svc.id.goog"
  }

  depends_on = [
    google_project_service.project_service_compute,
    google_project_service.project_service_iam,
    google_project_service.project_service_logging,
    google_project_service.project_service_monitoring,
    google_project_service.project_service_stackdriver
  ]
}

resource "google_container_node_pool" "alephium_stack_nodes" {
  project  = var.project_id
  name     = "alephium-stack"
  cluster  = google_container_cluster.cluster.name
  location = var.zone

  initial_node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }

  node_config {
    preemptible  = true
    machine_type = var.kubernetes_node_pool_primary_machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      preemptible-node = true
    }

    disk_size_gb = 25

    tags = [local.node_pool_ingress_tag]

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  management {
    auto_repair = true
  }

  depends_on = [
    google_container_cluster.cluster
  ]
}

resource "google_container_node_pool" "alephium_stack_gpu_nodes" {
  project  = var.project_id
  name     = "alephium-stack-gpu"
  cluster  = google_container_cluster.cluster.name
  location = var.zone

  initial_node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 1
  }

  node_config {
    preemptible  = true
    machine_type = var.kubernetes_node_pool_gpu_mining_machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      preemptible-node = true
    }

    disk_size_gb = 25

    tags = [local.node_pool_ingress_tag]

    guest_accelerator {
      type  = var.kubernetes_node_pool_gpu_mining_gpu_type
      count = 1
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  management {
    auto_repair = true
  }

  depends_on = [
    google_container_cluster.cluster
  ]
}

