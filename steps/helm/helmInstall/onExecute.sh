helm_install() {
  echo "onExecute step"
    printenv

    echo "##### Install helm chart ${step_configuration_repoName} #####"
    if [ -z "$step_configuration_chartVersion" ]
    then
      VERSION=""
    else
      VERSION="--version=${step_configuration_chartVersion}"
    fi

    helm install $step_configuration_helmName $step_configuration_helmChart \
                 $VERSION \
                 $int_helmInstallParameters_setFlags

}

execute_command helm_install
