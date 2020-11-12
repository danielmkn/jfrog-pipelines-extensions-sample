add_helm_repository() {
  echo "onExecute step"
    printenv

    echo "##### Add helm repository ${step_configuration_repoName} #####"

    helm init
    helm repo add $step_configuration_repoName $step_configuration_repoUrl
    helm repo update

}

execute_command add_helm_repository
