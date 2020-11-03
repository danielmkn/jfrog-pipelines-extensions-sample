run_kubectl_command() {
  echo "onExecute step"
    ls -al
    printenv
    echo $machineType
    echo "##### TEST #####"
    echo "%%context.machine-type%%"

    #gcloud container clusters get-credentials $res_gkeClusterResource_gkeClusterName --zone $res_gkeClusterResource_gkeClusterZone --project $res_gkeClusterResource_googleCloudProj

#    gcloud container clusters create $newGkeClusterName --zone $gkeClusterZone \
#      --node-locations $newGkeClusterZone --num-nodes $numNodes $clusterOptions \
#      --machine-type $machineType \
#      --min-nodes $minNodes --max-nodes $maxNodes --project $res_gkeClusterResource_googleCloudProj
}

execute_command run_kubectl_command
