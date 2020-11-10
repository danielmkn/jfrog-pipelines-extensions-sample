delete_resource_group() {
  echo "onExecute step"
    printenv

    # Delete resource group
    az group delete --name $res_azureResGroupResource_azureResourceGroup --no-wait --yes

}

execute_command delete_resource_group
