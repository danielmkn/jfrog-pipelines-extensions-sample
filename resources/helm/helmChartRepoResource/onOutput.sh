save_helmChartRepo_parameters() {
  echo "Environment variables for helmChartResource:"
  printenv

  echo "Helm chart repo parameters:"
  echo "Helm repo name: " $step_configuration_repoName
  echo "Helm repo url: " $step_configuration_repoUrl
  echo "Helm repo username: " $step_configuration_repoUsername


  write_output helmChartRepoResource repoName=$step_configuration_repoName \
                                     repoUrl=$step_configuration_repoUrl

  }

execute_command save_helmChartRepo_parameters
