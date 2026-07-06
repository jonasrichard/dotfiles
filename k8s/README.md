# Kubernetes

## Setup kubernetes dev env

- kubectl: `brew install kubectl`
- krew: [Install krew](https://krew.sigs.k8s.io/docs/user-guide/setup/install/)
- konfig: k krew install konfig
- kind: `brew install kind`

`kind get kubeconfig --name cluster-name | k konfig import --stdin > .kube-local.yaml`

Then

`KUBECONFIG=.kube-local.yaml k9s`

## Colima

To start colima but edit the config file before you can

```shell
colima start --edit --editor nvim
```

For me k9s complained that it cannot make an inotify, for that you need to edit
limits

```shell
colima ssh
sysctl 'fs.inotify.max_user_instances = 512'
```

## Commands

- `kubectl api-resources`

## Ephemeral container

```shell
kubectl debug -it <pod-name> --image=busybox --target=<container-name>
```
