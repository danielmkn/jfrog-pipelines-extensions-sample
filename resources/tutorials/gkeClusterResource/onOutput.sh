test_output() {
  echo "resource name: $1"
  printenv

  gcloud -v
}

execute_command "test_output %%context.resourceName%%"
