run_kubectl_command() {
  echo "onExecute step"
    ls -al
    echo "$int_gcpK8sPartnershipProject_jsonKey" | tee /tmp/serviceaccount_jfrog_gc_mp.json
    #gcloud auth activate-service-account --key-file=/tmp/serviceaccount_jfrog_gc_mp.json
    echo "Test if k8s configuration persist in the steps"
    kubectl get pods --all-namespaces
    kubectl get services --all-namespaces
    kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}'
}

execute_command run_kubectl_command
