# Install ingress-nginx

Follow the [Offical installation instruction](https://kubernetes.github.io/ingress-nginx/deploy/#gce-gke)

Specifically

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.2/deploy/static/provider/cloud/deploy.yaml
```

The `v1.0.2` version of the [deploy.yaml](deploy.yaml) file is downloaded and versioned controlled in this folder.
