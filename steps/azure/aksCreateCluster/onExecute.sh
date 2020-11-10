create_aks_cluster() {
  echo "onExecute step"
    printenv

    # Create resource group
    az group create -l $step_configuration_location -n $step_configuration_azureResourceGroup
    echo "##### Create AKS cluster ${step_configuration_azureResourceGroup} #####"
    az aks create --resource-group ${step_configuration_azureResourceGroup} --name ${step_configuration_aksClusterName} \
                  --node-count ${step_configuration_nodeCount} --node-vm-size ${step_configuration_vmSize} \
                  --service-principal $int_azurePartnership_appId --client-secret $int_azurePartnership_password \
                  ${step_configuration_clusterOptions}



}

execute_command create_aks_cluster
