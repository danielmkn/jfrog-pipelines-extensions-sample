list_cluster_pods() {
  echo "Resource name: $1"
  echo "Available variables in onOutput step"
  echo $res_gkeClusterResource_gkeClusterZone
  printenv

  echo "New GKE cluster parameters:"
  echo "Project name: " $res_configuration_googleCloudProj
  echo "Cluster name: " $res_configuration_gkeClusterName
  echo "Machine type: " $res_configuration_machineType
  echo "Number of nodes: " $res_configuration_numNodes
  echo "Minimum number of nodes: " $res_configuration_minNodes
  echo "Maximum number of nodes: " $res_configuration_maxNodes
  echo "Cluster options: " $res_configuration_clusterOptions

  write_output gkeCluster clusterName=$step_configuration_gkeClusterName zone=$step_configuration_gkeClusterZone \
                          project=$step_configuration_googleCloudProj machineType=$step_configuration_machineType




  # return cluster parameters

  }

execute_command list_cluster_pods
