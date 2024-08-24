# Access arbitrary Kubernetes services using tinyproxy

Launch the service in your Kubernetes environment:

```
kubectl apply -k deploy
```

Expose the proxy service using `kubectl port-forward`:

```
kubectl port-forward service/tinyproxy 8888:8888
```

Configure your proxy environment variables locally:

```
export https_proxy=http://localhost:8888
```

Use the proxy to access kubernetes services:

```
podman login --tls-verify=false -u "$(oc whoami)" -p "$(oc whoami -t)" image-registry.openshift-image-registry:5000
podman push --tls-verify=false myimage image-registry.openshift-image-registry.svc:5000/myproject/myimage
```
