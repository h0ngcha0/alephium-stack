Alephium Stack
==============

The code in this repository sets up the
[Alephium](https://github.com/alephium/alephium) stack in Kubernetes
on GCP (GKE), using Terraform and Kubernetes YAML files.

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

