get_lb_ip() {
  echo "onExecute step"
  printenv

  echo "#### Connecting to the k8s cluster ####"
  if [ -z "$res_gkeClusterResource_gkeClusterName" ]
  then
    az aks get-credentials --resource-group ${res_azureResGroupResource_azureResourceGroup} --name ${res_aksClusterResource_aksClusterName}
    if [ -z "$res_azureResGroupResource_namespase" ]
    then
        NAMESPACE=""
    else
        NAMESPACE="-n ${res_azureResGroupResource_namespase}"
    fi
  else
    gcloud container clusters get-credentials ${res_gkeClusterResource_gkeClusterName} --zone ${res_gkeClusterResource_gkeClusterZone} \
    --project ${res_gkeClusterResource_googleCloudProj}
    if [ -z "$res_gkeClusterResource_namespase" ]
    then
        NAMESPACE=""
    else
        NAMESPACE="-n ${res_gkeClusterResource_namespase}"
    fi
  fi

  LB_IP=$(kubectl get svc $NAMESPACE | grep LoadBalancer | awk '{$2=$2};1' | cut -f4 -d ' ')

}

execute_command get_lb_ip
