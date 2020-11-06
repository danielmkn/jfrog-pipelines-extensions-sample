create_aks_cluster() {
  echo "onExecute step"
    printenv

    # Create resource group
    az group create -l $step_configuration_location -n $step_configuration_aksResourceGroup
    echo "##### Create AKS cluster ${step_configuration_aksResourceGroup} #####"
    az aks create --resource-group ${step_configuration_aksResourceGroup} --name ${step_configuration_aksClusterName} \
                  --node-count ${step_configuration_nodeCount} --node-vm-size ${step_configuration_vmSize} \
                  ${step_configuration_clusterOptions}



}

execute_command create_aks_cluster
