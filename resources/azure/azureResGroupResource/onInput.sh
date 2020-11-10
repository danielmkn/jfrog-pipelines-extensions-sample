list_env_variables() {
  echo "Environment variables for azureResGroupResource:"
  printenv
  echo "az cli version:"
  az -v
}

execute_command list_env_variables
