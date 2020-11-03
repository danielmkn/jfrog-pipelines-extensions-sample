delete_gke_cluster() {
  echo "onExecute step"
    printenv
    echo "##### Delete GKE cluster $step_configuration_gkeClusterName #####"

    echo "### TESTING VALUES ###"
    echo "Project name: " $res_gkeClusterResource_project
    echo "Cluster name: " $res_gkeClusterResource_clusterName
    echo "Machine type: " $res_gkeClusterResource_machineType

}

execute_command delete_gke_cluster
