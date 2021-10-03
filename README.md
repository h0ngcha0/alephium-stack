Alephium Stack
==============

The code in this repository sets up the
[Alephium](https://github.com/alephium/alephium) stack in
[Kubernetes](https://kubernetes.io/) on
[GCP](https://cloud.google.com/). using Terraform and Kubernetes YAML
files.

Kubernetes YAML files can probably be re-used in other cloud providers
as well.

The following sites are exposed using the code in this repository:

- [Alephium Explorer](https://alephium.hongchao.me/#/blocks)
- [Alephium Overview - Grafana](https://grafana.hongchao.me/d/S3eJTo3Mk/alephium-overview?orgId=1&refresh=10s)
- [Alephium API Documentation](https://alephium.hongchao.me/docs)
- Alephium Full Node with Mining (exposed at 35.241.179.18:9973)

## Sets up the GCP project and GKE cluster

1. If you have not setup GCP for your google account already, you can
   try to set it up [here](https://cloud.google.com/gcp/). For new
   users, Google offers 300 USD credits. To start the trial, Google
   requires registration of payment method. According to the [terms
   and conditions](https://cloud.google.com/terms/free-trial/) for GCP
   free trial, mining cryptocurrency is not allowed, but running a
   full node is *not* mining.
2. After GCP is setup, you can find your billing account id
   [here](https://console.cloud.google.com/billing)

After that, go to the terraform folder and run

```
terraform init
terraform apply -var="project_billing_account=YOUR_BILLING_ACCOUNT"
```

