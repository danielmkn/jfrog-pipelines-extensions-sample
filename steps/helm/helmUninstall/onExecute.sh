helm_uninstall() {
  echo "onExecute step"
    printenv

    echo "#### Check Helm version before installation (affinity groupt test) ####"
    echo "Username: "
    which helm

    if [ -z "$res_gkeClusterResource_gkeClusterName" ]
    then
      az aks get-credentials --resource-group ${res_azureResGroupResource_azureResourceGroup} \
      --name ${step_configuration_aksClusterName}
    else
      gcloud container clusters get-credentials $res_gkeClusterResource_gkeClusterName --zone $res_gkeClusterResource_gkeClusterZone \
      --project $res_gkeClusterResource_googleCloudProj
    fi

    echo "Helm 3 install"
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh

    helm version
    echo "##### Uninstall Helm chart ${res_helmInstallResource_helmChart} #####"
    helm uninstall $res_helmInstallResource_helmName
}

execute_command helm_uninstall
