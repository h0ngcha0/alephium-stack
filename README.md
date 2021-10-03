Alephium Stack
==============

Code in this repository helps to run the
[Alephium](https://github.com/alephium/alephium) stack on [Google
Cloud Platform](https://cloud.google.com/) using [Kubernetes
Engine](https://cloud.google.com/kubernetes-engine/). The following
sites are setup and exposed using the code in this repository:

- [Alephium Explorer](https://alephium.hongchao.me/#/blocks) (`https://alephium.hongchao.me`)
- [Alephium Overview - Grafana](https://grafana.hongchao.me/d/S3eJTo3Mk/alephium-overview?orgId=1&refresh=10s) (`https://grafana.hongchao.me`)
- [Alephium API Documentation](https://alephium.hongchao.me/docs) (`https://alephium.hongchao.me/docs`)
- Alephium Full Node with [CPU Miner](https://github.com/alephium/cpu-miner) Enabled (`35.241.179.18:9973`)

[Terraform](terraform) files are GCP specific. [Kubernetes YAML
files](kubernetes) can probably be re-used with other cloud providers.

## Prerequisit

* [Terraform](https://www.terraform.io/)
* [Google Cloud SDK](https://cloud.google.com/sdk/)

## Setup

### GCP project and GKE cluster

1. If you have not setup GCP for your google account already, you can
   try to set it up [here](https://cloud.google.com/gcp/). For new
   users, Google offers 300 USD credits. To start the trial, Google
   requires registration of payment method. According to the [terms
   and conditions](https://cloud.google.com/terms/free-trial/) for GCP
   free trial, mining cryptocurrency is not allowed, but running a
   full node is *not* mining. Outside of the trial period however, it
   is ok to mine cryptocurrency.
2. After GCP is setup, you can find your billing account id
   [here](https://console.cloud.google.com/billing)

After that, go to the terraform folder and run

```
terraform init
terraform apply -var="project_billing_account=YOUR_BILLING_ACCOUNT"
```

More powerful [machine
types](https://cloud.google.com/compute/docs/machine-types) can be set
up using `kubernetes_node_pool_machine_type` variable, which might be
helpful during mining. More available variables please check the
[variables.tf](terraform/variables.tf) file.

