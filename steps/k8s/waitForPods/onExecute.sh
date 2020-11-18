wait_for_pods() {
  echo "onExecute step"
  printenv

  echo "#### Connecting to the k8s cluster ####"
  if [ -z "$res_gkeClusterResource_gkeClusterName" ]
  then
    az aks get-credentials --resource-group ${res_azureResGroupResource_azureResourceGroup} --name ${res_aksClusterResource_aksClusterName}
  else
    gcloud container clusters get-credentials $res_gkeClusterResource_gkeClusterName --zone ${res_gkeClusterResource_gkeClusterZone} \
    --project ${res_gkeClusterResource_googleCloudProj}
  fi


  echo "#####################"
  echo "### Wait for pods ###"
  echo "#####################"
  DEPLOYMENT_NOT_FINISHED=$(kubectl get deployment | awk '{$2=$2};1' | cut -f2 -d ' ' | grep -v "READY" | grep -v "1/1"| wc -l)
  STATEFULSET_NOT_FINISHED=$(kubectl get statefulset | awk '{$2=$2};1' | cut -f2 -d ' ' | grep -v "READY" | grep -v "1/1"| wc -l)
  JOBS_NOT_FINISHED=$(kubectl get jobs | awk '{$2=$2};1' | cut -f2 -d ' ' | grep -v "COMPLETIONS" | grep -v "1/1"| wc -l)
  PODS_ERROR=$(kubectl get pods | grep -i 'err' | wc -l)
  while [ "${DEPLOYMENT_NOT_FINISHED}" -gt 0 ] || [ "${STATEFULSET_NOT_FINISHED}" -gt 0 ] || [ "${JOBS_NOT_FINISHED}" -gt 0 ]
  do
    sleep 15
    DEPLOYMENT_NOT_FINISHED=$(kubectl get deployment | awk '{$2=$2};1' | cut -f2 -d ' ' | grep -v "READY" | grep -v "1/1"| wc -l)
    STATEFULSET_NOT_FINISHED=$(kubectl get statefulset | awk '{$2=$2};1' | cut -f2 -d ' ' | grep -v "READY" | grep -v "1/1"| wc -l)
    JOBS_NOT_FINISHED=$(kubectl get jobs | awk '{$2=$2};1' | cut -f2 -d ' ' | grep -v "COMPLETIONS" | grep -v "1/1"| wc -l)
    PODS_ERROR=$(kubectl get pods | grep -i 'err' | wc -l)
    if [ "${PODS_ERROR}" -gt 0 ]
    then
      echo "Deployment went to error state. Failed!"
      exit 1
    else
      kubectl get pods
    fi
  done

}

execute_command wait_for_pods
