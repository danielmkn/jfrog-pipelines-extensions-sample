add_helm_repository() {
  echo "onExecute step"
    printenv

    echo "### test connect to gke cluster ###"

    gcloud container clusters get-credentials created-by-pipelines-extension --zone us-central1-c \
     --project jfrog-partnership-team

    echo "##### Add helm repository ${step_configuration_repoName} #####"

    #helm version
    echo "helm 3 install"
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh

    helm version
    echo "helm repo add"
    helm repo add $step_configuration_repoName $step_configuration_repoUrl
    echo "helm update"
    helm repo update
    helm repo list

}

execute_command add_helm_repository
