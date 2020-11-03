run_kubectl_command() {
  echo "onExecute step"
    ls -al
    printenv
    echo "##### TEST #####"
    res_gkeClusterResource_gkeClusterZone="newClusterZone"


}

execute_command run_kubectl_command
