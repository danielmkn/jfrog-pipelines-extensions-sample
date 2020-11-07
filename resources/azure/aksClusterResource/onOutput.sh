save_cluster_parameters() {
  echo "Environment variables for aksClusterResource:"
  printenv

  echo "AKS cluster parameters:"
  echo "Resource group name: " $step_configuration_azureResourceGroup
  echo "Cluster name: " $step_configuration_aksClusterName
  echo "Cluster location: " $step_configuration_location
  echo "VM size: " $step_configuration_vmSize
  echo "Node count: " $step_configuration_nodeCount
  echo "Minimum number of nodes: " $step_configuration_minCount
  echo "Maximum number of nodes: " $step_configuration_maxCount
  echo "Cluster options: " $step_configuration_clusterOptions

  write_output aksClusterResource aksResourceGroup=$step_configuration_aksResourceGroup \
                                  aksClusterName=$step_configuration_aksClusterName \
                                  location=$step_configuration_location \
                                  vmSize=$step_configuration_vmSize \
                                  numNodes=$step_configuration_nodeCount \
                                  minCount=$step_configuration_minCount \
                                  maxCount=$step_configuration_maxCount \
                                  clusterOptions=$step_configuration_clusterOptions
  }

execute_command save_cluster_parameters
