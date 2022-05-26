variable "project_name" {
  type        = string
  description = "Name of the Google project."
  default     = "Alephium Stack"
}

variable "project_id" {
  type        = string
  description = "Id of the Google project for running the Alephium stack."
  default     = "alephium"
}

variable "region" {
  type        = string
  description = "Google project region."
  default     = "europe-west4"
}

# europe-west4-a and europe-west4-b
variable "zone" {
  type        = string
  description = "Google project zone."
  default     = "europe-west4-a"
}

variable "kubernetes_node_pool_primary_machine_type" {
  type        = string
  description = "Machine type for Kubernetes primary node pool."
  default     = "e2-highmem-2"
}

variable "kubernetes_node_pool_gpu_mining_machine_type" {
  type        = string
  description = "Machine type for Kubernetes GPU mining node pool."
  default     = "n1-standard-1"
}

variable "enable_gpu_mining" {
  type        = bool
  description = "Enable GPU mining pool"
  default     = false
}

variable "kubernetes_node_pool_gpu_mining_gpu_type" {
  type        = string
  description = "GPU type for Kubernetes GPU mining node pool."
  default     = "nvidia-tesla-v100"
}

variable "project_billing_account" {
  type        = string
  description = "Billing account for the project."
}
