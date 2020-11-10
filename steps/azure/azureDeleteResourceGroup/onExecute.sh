delete_resource_group() {
  echo "onExecute step"
    printenv

    # Create resource group
    if [ $res_aksClusterResource_isDeleted = true ]
      then
        az group delete --name $res_aksClusterResource_azureResourceGroup --no-wait --yes
      else
        echo "The cluster is not deleted yet"
    fi
}

execute_command delete_resource_group
