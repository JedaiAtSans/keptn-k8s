# Setting up Keptn

Use the scripts provided to set up Keptn on your machine.

Start with `create-cluster.sh`. This will create a k3d kubernetes cluster with the k8s image `rancher/k3s:v1.21.12-k3s1-arm64`. The kubeapi is set to `https://127.0.0.1:6445` in the `k3d-cluster-config.yaml`.

If a cluster named mykeptn exists, run `delete-cluster.sh`. 

After the cluster is created, install keptn with `install-keptn.sh`. 