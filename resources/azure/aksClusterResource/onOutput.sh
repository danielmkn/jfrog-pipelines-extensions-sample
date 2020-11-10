save_cluster_parameters() {
  echo "Environment variables for aksClusterResource:"
  printenv

  echo "AKS cluster parameters:"
  echo "Resource group name: " $res_azureResGroupResource_azureResourceGroup
  echo "Cluster location: " $res_azureResGroupResource_location
  echo "Cluster name: " $step_configuration_aksClusterName
  echo "VM size: " $step_configuration_vmSize
  echo "Node count: " $step_configuration_nodeCount
  echo "Cluster options: " $step_configuration_clusterOptions

  write_output aksClusterResource aksResourceGroup=$res_azureResGroupResource_azureResourceGroup \
                                  location=$res_azureResGroupResource_location \
                                  aksClusterName=$step_configuration_aksClusterName \
                                  vmSize=$step_configuration_vmSize \
                                  numNodes=$step_configuration_nodeCount \
                                  minCount=$step_configuration_minCount \
                                  maxCount=$step_configuration_maxCount \
                                  clusterOptions=$step_configuration_clusterOptions \
                                  isDeleted=$step_configuration_isDeleted
  }

execute_command save_cluster_parameters
