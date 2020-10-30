test_input() {
  echo "Resource name: $1"
  echo "Environment variables:"
  printenv
  echo "Gcloud version:"
  gcloud -v
  echo "gcloud container clusters get-credentials $res_gkeClusterResource_gkeClusterName --zone $res_gkeClusterResource_gkeClusterZone --project $res_gkeClusterResource_googleCloudProj"
  gcloud container clusters get-credentials $res_gkeClusterResource_gkeClusterName --zone $res_gkeClusterResource_gkeClusterZone --project $res_gkeClusterResource_googleCloudProj
  kubectl get pods --all-namespaces
}

execute_command "test_input %%context.resourceName%%"
