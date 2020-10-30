test_input() {
  echo "Resource name: $1"
  echo "Environment variables:"
  printenv
  echo "Gcloud version:"
  gcloud -v
  kubectl get pods --all-namespaces
}

execute_command "test_input %%context.resourceName%%"
