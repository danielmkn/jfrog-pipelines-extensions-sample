success() {
    echo "SUCCESS"
    echo "Pods are up and running"
    kubectl get svc
}

execute_command success
