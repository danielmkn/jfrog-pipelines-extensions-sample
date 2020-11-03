delete_gke_cluster() {
  echo "onExecute step"
    printenv
    echo "##### Delete GKE cluster $step_configuration_gkeClusterName #####"

    echo $step_configuration_googleCloudProj


}

execute_command delete_gke_cluster
