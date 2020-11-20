helm_uninstall() {
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

    echo "Helm 3 install"
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh

    helm version
    echo "##### Uninstall Helm chart ${res_helmInstallResource_helmChart} #####"
    NAMESPACE="${res_helmInstallResource_namespace:-default}"
    helm uninstall ${res_helmInstallResource_helmName} -n $NAMESPACE
}

execute_command helm_uninstall
