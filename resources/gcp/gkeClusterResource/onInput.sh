list_env_variables() {
  echo "Environment variables for gkeClusterResource:"
  printenv
  echo "Gcloud version:"
  gcloud -v
}

execute_command list_env_variables
