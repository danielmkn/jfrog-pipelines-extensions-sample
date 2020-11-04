delete_gke_cluster() {
  echo "onExecute step"
  printenv
  echo "##### Delete GKE cluster ${res_gkeClusterResource_clusterName} #####"

  echo "### TESTING VALUES ###"
  echo "Project name: " ${res_gkeClusterResource_googleCloudProj}
  echo "Cluster name: " ${res_gkeClusterResource_gkeClusterName}
  echo "Machine type: " ${res_gkeClusterResource_machineType}
  echo "Zone: " ${res_gkeClusterResource_gkeClusterZone}

  gcloud container clusters delete ${res_gkeClusterResource_gkeClusterName} \
    --zone ${res_gkeClusterResource_gkeClusterZone} --project ${res_gkeClusterResource_googleCloudProj} --quiet
}

execute_command delete_gke_cluster
