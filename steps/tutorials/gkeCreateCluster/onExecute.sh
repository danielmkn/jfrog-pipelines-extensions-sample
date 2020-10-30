run_kubectl_command() {
  echo "onExecute step"
    ls -al
    kubectl get pods --all-namespaces
    kubectl get services --all-namespaces
    kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}'
}

execute_command run_kubectl_command
