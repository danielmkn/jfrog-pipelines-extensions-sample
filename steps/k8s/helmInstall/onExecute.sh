helm_install() {
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
    # Verify if the chart version is passed from the pipelines
    if [ -z "$step_configuration_chartVersion" ]
    then
      VERSION=""
    else
      VERSION="--version=${step_configuration_chartVersion}"
    fi
    # Verify if namespace is passed from the pipelines
    if [ -z "$step_configuration_namespace" ]
    then
      NAMESPACE=""
    else
      # Verify if namespace exists, if not - create
      if ! kubectl get namespaces -o json | jq -r ".items[].metadata.name" | grep ${step_configuration_namespace};
      then
        echo "Creating a new namespace ${step_configuration_namespace}"
        kubectl create namespace ${step_configuration_namespace}
      fi
      NAMESPACE="-n ${step_configuration_namespace}"
    fi


    echo "Helm 3 install"
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    chmod 700 get_helm.sh
    echo "Run Helm installation script"
    ./get_helm.sh

    helm version
    echo "##### Add helm repository ${step_configuration_repoName} #####"
    helm repo add ${step_configuration_repoName} ${step_configuration_repoUrl}
    helm repo update
    helm repo list

    echo "##### Install Helm chart ${step_configuration_helmChart} #####"
    helm install ${step_configuration_helmName} ${step_configuration_helmChart} \
                 ${VERSION} \
                 ${NAMESPACE} \
                 ${int_helmInstallParameters_setFlags}

}

execute_command helm_install
