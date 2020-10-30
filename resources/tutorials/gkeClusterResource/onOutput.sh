test_output() {
  echo "Resource name: $1"
  echo "Output"

  }

execute_command "test_output %%context.resourceName%%"
