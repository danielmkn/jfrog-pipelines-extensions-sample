create_aks_cluster() {
  echo "onExecute step"
    printenv

    # Create resource group
    az group create -l $step_configuration_location -n $step_configuration_aksResourceGroup

    echo "##### Create AKS cluster ${step_configuration_aksResourceGroup} #####"


}

execute_command create_aks_cluster
