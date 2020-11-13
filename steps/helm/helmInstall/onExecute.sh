helm_install() {
  echo "onExecute step"
    printenv

    #TODO: add GKE and AKS connection command. Find out which flag to use to determine which connection to use
    gcloud container clusters get-credentials $res_gkeClusterResource_gkeClusterName --zone $res_gkeClusterResource_gkeClusterZone \
     --project $res_gkeClusterResource_googleCloudProj

    if [ -z "$step_configuration_chartVersion" ]
    then
      VERSION=""
    else
      VERSION="--version=${step_configuration_chartVersion}"
    fi

    echo "##### Add helm repository ${step_configuration_repoName} #####"
    echo "Helm 3 install"
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh

    helm version
    echo "helm repo add"
    helm repo add $step_configuration_repoName $step_configuration_repoUrl
    helm repo update
    helm repo list

    echo "##### Install Helm chart ${step_configuration_helmChart} #####"
    helm install $step_configuration_helmName $step_configuration_helmChart \
                 $VERSION \
                 $int_helmInstallParameters_setFlags

}

execute_command helm_install
