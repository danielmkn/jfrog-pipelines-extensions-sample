create_resource_group() {
  echo "onExecute step"
    printenv

    # Create resource group
    az group create -l $step_configuration_location -n $step_configuration_azureResourceGroup

}

execute_command create_resource_group
