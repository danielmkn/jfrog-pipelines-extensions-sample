delete_gke_cluster() {
  echo "onExecute step"
    printenv
    echo "##### Delete GKE cluster $step_configuration_gkeClusterName #####"

    echo "### TESTING VALUES ###"
    echo "Project name: RES" $res_gkeClusterResource_project
    echo "Cluster name: RES" $res_gkeClusterResource_clusterName
    echo "Machine type: RES" $res_gkeClusterResource_machineType


    echo "Project name: STEP " $step_gkeClusterResource_project
    echo "Cluster name: STEP" $step_gkeClusterResource_clusterName
    echo "Machine type: STEP" $step_gkeClusterResource_machineType

}

execute_command delete_gke_cluster
