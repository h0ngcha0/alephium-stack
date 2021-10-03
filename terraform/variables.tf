variable "project_name" {
  type        = string
  description = "Name of the Google project."
  default     = "Alephium Stack"
}

variable "project_id" {
  type        = string
  description = "Id of the Google project for running the Alephium stack."
  default     = "alephium-stack"
}

variable "region" {
  type        = string
  description = "Google project region."
  default     = "europe-west1"
}

variable "zone" {
  type        = string
  description = "Google project zone."
  default     = "europe-west1-d"
}

variable "kubernetes_node_pool_machine_type" {
  type        = string
  description = "Machine type for Kubernetes node pool."
  default     = "e2-standard-2"
}

variable "project_billing_account" {
  type        = string
  description = "Billing account for the project."
}
