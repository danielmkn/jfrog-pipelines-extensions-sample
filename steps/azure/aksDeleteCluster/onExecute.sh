delete_aks_cluster() {
  echo "onExecute step"
  printenv
  echo "##### Delete AKS cluster ${res_aksClusterResource_aksClusterName} #####"

  echo "### TESTING VALUES ###"
  echo "Resource group name: " $res_configuration_azureResourceGroup
  echo "Cluster name: " $res_configuration_aksClusterName
  echo "Cluster location: " $res_configuration_location
  echo "VM size: " $res_configuration_vmSize
  echo "Node count: " $res_configuration_numNodes
  echo "Minimum number of nodes: " $res_configuration_minCount
  echo "Maximum number of nodes: " $res_configuration_maxCount
  echo "Cluster options: " $res_configuration_clusterOptions

}

execute_command delete_aks_cluster
