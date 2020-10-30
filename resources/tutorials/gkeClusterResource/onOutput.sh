list_cluster_pods() {
  echo "Resource name: $1"
  echo "Cluster pods in all namespaces:"
  kubectl get pods --all-namespaces

  }

execute_command "test_output %%context.list_cluster_pods%%"
