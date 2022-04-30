# Install cert-manager

Follow the [official installation instruction](https://cert-manager.io/docs/installation/#default-static-install)

Specifically:
```
$ helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.6.1 \
  --set installCRDs=true
```

