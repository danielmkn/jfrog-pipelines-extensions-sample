save_helmInstallationResource_parameters() {
  echo "Environment variables for helmChartResource:"
  printenv

  if [ -z "$step_configuration_chartVersion" ]
    then
      VERSION="latest"
    else
      VERSION=${step_configuration_chartVersion}
  fi

  echo "Helm chart installation parameters:"
  echo "Helm installation name: " $step_configuration_helmName
  echo "Helm repo name: " $step_configuration_repoName
  echo "Helm repo url: " $step_configuration_repoUrl
  echo "Helm chart pth: " $step_configuration_helmChart
  echo "Helm chart version: " $VERSION

  write_output helmInstallationResource helmName=$step_configuration_helmName \
                                        repoName=$step_configuration_repoName \
                                        repoUrl=$step_configuration_repoUrl \
                                        helmChart=$step_configuration_helmChart \
                                        chartVersion=$VERSION
  }

execute_command save_helmInstallationResource_parameters
