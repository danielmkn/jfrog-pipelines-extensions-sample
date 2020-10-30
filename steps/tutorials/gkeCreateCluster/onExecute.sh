checkHealth() {
  echo "onExecute test"
    ls -al
    ls -lad /tmp
    sudo chmod 1777 /tmp
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    sudo apt-get install apt-transport-https ca-certificates gnupg
    sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt-get update && sudo apt-get install google-cloud-sdk
    gcloud -v
    echo $int_gcpK8sMarketplaceProject_jsonKey | tee /tmp/serviceaccount_jfrog_gc_mp.json
    gcloud auth activate-service-account --key-file=/tmp/serviceaccount_jfrog_gc_mp.json
}

execute_command checkHealth
