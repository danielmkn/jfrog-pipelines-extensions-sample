run_kubectl_command() {
  echo "onExecute step"
    printenv
    echo "##### Delete GKE cluster $step_configuration_gkeClusterName #####"

    echo $step_configuration_googleCloudProj


}

execute_command run_kubectl_command
