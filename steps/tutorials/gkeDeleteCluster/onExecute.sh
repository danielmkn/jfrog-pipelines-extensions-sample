delete_gke_cluster() {
  echo "onExecute step"
    printenv
    echo "##### Delete GKE cluster $step_configuration_gkeClusterName #####"

    echo "### TESTING VALUES ###"
    echo "Project name: " $res_gkeCluster_project
    echo "Cluster name: " $res_gkeCluster_clusterName
    echo "Machine type: " $res_gkeCluster_machineType

}

execute_command delete_gke_cluster
