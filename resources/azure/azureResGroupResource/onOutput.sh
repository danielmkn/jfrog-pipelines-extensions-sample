save_rg_parameters() {
  echo "Environment variables for azureResGroupResource:"
  printenv

  echo "Azure resource group parameters:"
  echo "Resource group name: " $step_configuration_azureResourceGroup
  echo "Resource group location: " $step_configuration_location


  write_output azureResGroupResource azureResourceGroup=$step_configuration_azureResourceGroup \
                                     location=$step_configuration_location \

  }

execute_command save_rg_parameters
