list_cluster_pods() {
  echo "Resource name: $1"
  echo "Cluster pods in all namespaces:"
  kubectl get pods --all-namespaces

  # return cluster parameters

  }

execute_command list_cluster_pods
