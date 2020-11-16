helm_uninstall() {
  echo "onExecute step"
    printenv

    echo "#### Check Helm version before installation (affinity groupt test) ####"
    helm version
    echo "Var from previous step: ${TEST}"

    #TODO: add GKE and AKS connection command. Find out which flag to use to determine which connection to use
    gcloud container clusters get-credentials $res_gkeClusterResource_gkeClusterName --zone $res_gkeClusterResource_gkeClusterZone \
     --project $res_gkeClusterResource_googleCloudProj

    echo "Helm 3 install"
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh

    helm version
    echo "##### Uninstall Helm chart ${res_helmInstallResource_helmChart} #####"
    helm uninstall $res_helmInstallResource_helmName
}

execute_command helm_uninstall
