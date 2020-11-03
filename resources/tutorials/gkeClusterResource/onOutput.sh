list_cluster_pods() {
  echo "Resource name: $1"
  echo "Available variables in onOutput step"
  echo $googleCloudProj
  printenv



  # return cluster parameters

  }

execute_command list_cluster_pods
