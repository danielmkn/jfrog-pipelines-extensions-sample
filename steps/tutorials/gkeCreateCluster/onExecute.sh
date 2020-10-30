run_kubectl_command() {
  echo "onExecute step"
    ls -al
    gcloud container clusters get-credentials $res_gkeClusterResource_gkeClusterName --zone $res_gkeClusterResource_gkeClusterZone --project $res_gkeClusterResource_googleCloudProj
    echo "Test if k8s configuration persist in the steps"
    kubectl get pods --all-namespaces
    echo "External IP addresses in the cluster:"
    kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}'
}

execute_command run_kubectl_command
