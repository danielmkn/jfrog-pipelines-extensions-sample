list_env_variables() {
  echo "Environment variables for helmInstallationRepoResource:"
  printenv
  echo "Helm version:"
  helm version
}

execute_command list_env_variables
