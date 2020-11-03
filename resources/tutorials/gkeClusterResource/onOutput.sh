list_cluster_pods() {
  echo "Resource name: $1"
  echo "Available variables in onOutput step"
  echo $res_gkeClusterResource_gkeClusterZone
  printenv




  # return cluster parameters

  }

execute_command list_cluster_pods
