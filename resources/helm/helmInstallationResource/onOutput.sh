save_helmInstallationResource_parameters() {
  echo "Environment variables for helmChartResource:"
  printenv

  echo "Helm chart installation parameters:"
  echo "Helm installation name: " $step_configuration_helmName
  echo "Helm repo name: " $step_configuration_repoName
  echo "Helm repo url: " $step_configuration_repoUrl

  if [ -z "$step_configuration_chartVersion" ]
    then
      VERSION=""
    else
      VERSION=${step_configuration_chartVersion}
  fi

  write_output helmInstallationResource repoName=$step_configuration_helmName \
                                        repoName=$step_configuration_repoName \
                                        repoUrl=$step_configuration_repoUrl \
                                        chartVersion=$VERSION

  }

execute_command save_helmInstallationResource_parameters
