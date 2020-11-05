save_cluster_parameters() {
  echo "Resource name: $1"
  echo "Available variables in onOutput step"
  printenv

  echo "GKE cluster parameters:"
  echo "Project name: " $step_configuration_googleCloudProj
  echo "Cluster name: " $step_configuration_gkeClusterName
  echo "Cluster zone: " $step_configuration_gkeClusterZone
  echo "Machine type: " $step_configuration_machineType
  echo "Number of nodes: " $step_configuration_numNodes
  echo "Minimum number of nodes: " $step_configuration_minNodes
  echo "Maximum number of nodes: " $step_configuration_maxNodes
  echo "Cluster options: " $step_configuration_clusterOptions

  write_output gkeClusterResource gkeClusterName=$step_configuration_gkeClusterName \
                                  gkeClusterZone=$step_configuration_gkeClusterZone \
                                  googleCloudProj=$step_configuration_googleCloudProj \
                                  machineType=$step_configuration_machineType \
                                  numNodes=$step_configuration_numNodes \
                                  minNodes=$step_configuration_minNodes \
                                  maxNodes=$step_configuration_maxNodes \
                                  clusterOptions=$step_configuration_clusterOptions

  }

execute_command save_cluster_parameters
