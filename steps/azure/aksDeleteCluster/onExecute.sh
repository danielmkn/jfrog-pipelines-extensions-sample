delete_aks_cluster() {
  echo "onExecute step"
  printenv
  echo "##### Delete AKS cluster ${res_aksClusterResource_aksClusterName} #####"

  echo "### TESTING VALUES ###"
  echo "Resource group name: " $res_aksClusterResource_azureResourceGroup
  echo "Cluster name: " $res_aksClusterResource_aksClusterName
  echo "Cluster location: " $res_aksClusterResource_location
  echo "VM size: " $res_aksClusterResource_vmSize
  echo "Node count: " $res_aksClusterResource_numNodes
  echo "Minimum number of nodes: " $res_aksClusterResource_minCount
  echo "Maximum number of nodes: " $res_aksClusterResource_maxCount
  echo "Cluster options: " $res_aksClusterResource_clusterOptions

  az aks show --resource-group ${res_aksClusterResource_aksResourceGroup} --name ${res_aksClusterResource_aksClusterName}

}

execute_command delete_aks_cluster
