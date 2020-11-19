success() {
    echo "SUCCESS"
    echo "Pods are up and running"
    kubectl get pods -n "$NAMESPACE"
}

execute_command success
