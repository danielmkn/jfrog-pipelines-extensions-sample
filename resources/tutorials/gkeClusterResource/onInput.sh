list_env_variables() {
  echo "Resource name: $1"
  echo "Environment variables:"
  printenv
  echo "Gcloud version:"
  gcloud -v
}

execute_command "test_input %%context.list_env_variables%%"
