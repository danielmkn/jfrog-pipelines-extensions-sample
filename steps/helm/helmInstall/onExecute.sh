helm_install() {
  echo "onExecute step"
    printenv

    echo "##### Install helm chart ${step_configuration_repoName} #####"

    helm install $step_configuration_helmName $step_configuration_helmChart \
                 $step_configuration_setFlags

}

execute_command helm_install
