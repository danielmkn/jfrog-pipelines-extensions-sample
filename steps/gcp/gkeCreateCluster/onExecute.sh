create_gke_cluster() {
  echo "onExecute step"
    printenv
    echo "##### Create GKE cluster ${step_configuration_gkeClusterName} #####"

    gcloud container clusters create $step_configuration_gkeClusterName --zone $step_configuration_gkeClusterZone \
      --node-locations $step_configuration_gkeClusterZone --num-nodes $step_configuration_numNodes $step_configuration_clusterOptions \
      --machine-type $step_configuration_machineType \
      --min-nodes $step_configuration_minNodes --max-nodes $step_configuration_maxNodes --project $step_configuration_googleCloudProj

    gcloud container clusters get-credentials $step_configuration_gkeClusterName --zone $step_configuration_gkeClusterZone \
     --project $step_configuration_googleCloudProj

}

execute_command create_gke_cluster
