save_helmInstallationResource_parameters() {
  echo "Environment variables for helmChartResource:"
  printenv

  echo "Helm chart repo parameters:"
  echo "Helm installation name: " $step_configuration_helmName

  write_output helmInstallationResource repoName=$step_configuration_helmName

  }

execute_command save_helmInstallationResource_parameters
