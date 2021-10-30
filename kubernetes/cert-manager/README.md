# Install cert-manager

Follow the [official installation instruction](https://cert-manager.io/docs/installation/#default-static-install)

Specifically:
```
kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole=cluster-admin \
    --user=$(gcloud config get-value core/account)

kubectl create -f https://github.com/jetstack/cert-manager/releases/download/v1.6.0/cert-manager.yaml
```

The `v1.6.0` version of the [cert-manager.yaml](cert-manager.yaml) file is downloaded and versioned controlled in this folder.
