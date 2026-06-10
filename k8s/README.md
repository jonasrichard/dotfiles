# Kubernetes

## Setup kubernetes dev env

* kubectl: `brew install kubectl`
* krew: [Install krew](https://krew.sigs.k8s.io/docs/user-guide/setup/install/)
* konfig: k krew install konfig
* kind: `brew install kind`

`kind get kubeconfig --name cluster-name | k konfig import --stdin > .kube-local.yaml`

Then

`KUBECONFIG=.kube-local.yaml k9s`
