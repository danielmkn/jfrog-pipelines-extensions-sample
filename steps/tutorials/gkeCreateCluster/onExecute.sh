run_kubectl_command() {
  echo "onExecute step"
    printenv
    echo "##### TEST #####"

    gcloud container clusters create $step_configuration_gkeClusterName --zone $step_configuration_gkeClusterZone \
      --node-locations $step_configuration_gkeClusterZone --num-nodes $step_configuration_numNodes $step_configuration_clusterOptions \
      --machine-type $step_configuration_machineType \
      --min-nodes $step_configuration_minNodes --max-nodes $step_configuration_maxNodes --project $step_configuration_googleCloudProj

    gcloud container clusters get-credentials $step_configuration_gkeClusterName --zone $step_configuration_gkeClusterZone \
     --project $step_configuration_googleCloudProj

    res_configuration_googleCloudProj=$step_configuration_googleCloudProj
    res_configuration_gkeClusterName=$step_configuration_gkeClusterName
    res_configuration_machineType=$step_configuration_machineType
    res_configuration_numNodes=$step_configuration_numNodes
    res_configuration_minNodes=$step_configuration_minNodes
    res_configuration_maxNodes=$step_configuration_maxNodes
    res_configuration_clusterOptions=$step_configuration_clusterOptions

    echo "New GKE cluster parameters:"
    echo "Project name: " $res_configuration_googleCloudProj
    echo "Cluster name: " $res_configuration_gkeClusterName
    echo "Machine type: " $res_configuration_machineType
    echo "Number of nodes: " $res_configuration_numNodes
    echo "Minimum number of nodes: " $res_configuration_minNodes
    echo "Maximum number of nodes: " $res_configuration_maxNodes
    echo "Cluster options: " $res_configuration_clusterOptions

}

execute_command run_kubectl_command
