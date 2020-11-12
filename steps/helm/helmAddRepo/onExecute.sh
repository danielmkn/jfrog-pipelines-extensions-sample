add_helm_repository() {
  echo "onExecute step"
    printenv

    echo "### test connect to gke cluster ###"

    gcloud container clusters get-credentials created-by-pipelines-extension --zone us-central1-c \
     --project jfrog-partnership-team

    echo "##### Add helm repository ${step_configuration_repoName} #####"

    helm version
    echo "helm init"
    helm init
    echo "helm repo add"
    helm repo add $step_configuration_repoName $step_configuration_repoUrl
    echo "helm update"
    helm repo update

}

execute_command add_helm_repository
