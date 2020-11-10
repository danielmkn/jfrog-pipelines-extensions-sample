create_resource_group() {
  echo "onExecute step"
    printenv

    # Create resource group
    az group delete --name $res_aksClusterResource_azureResourceGroup --no-wait --yes

}

execute_command create_resource_group
