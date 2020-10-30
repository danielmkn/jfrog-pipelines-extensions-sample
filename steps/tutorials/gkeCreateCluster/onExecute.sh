run_kubectl_command() {
  echo "onExecute step"
    ls -al
    printenv
    echo $machine-type
    echo "11111"
    echo "%%context.machine-type%%"
    #gcloud container clusters get-credentials $res_gkeClusterResource_gkeClusterName --zone $res_gkeClusterResource_gkeClusterZone --project $res_gkeClusterResource_googleCloudProj
#    gcloud container clusters create $newGkeClusterName --zone $newGkeClusterZone \
#      --node-locations $newGkeClusterZone --num-nodes $num-nodes $enable-autoscaling \
#      --machine-type $machine-type \
#      --min-nodes $min-nodes --max-nodes $max-nodes --project $res_gkeClusterResource_googleCloudProj




}

execute_command run_kubectl_command
