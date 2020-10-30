test_input() {
  echo "resource name: $1"
  printenv
  echo "Testing"
  gcloud -v
  echo $int_gcpK8sPartnershipProject_jsonKey


}

execute_command "test_input %%context.resourceName%%"
