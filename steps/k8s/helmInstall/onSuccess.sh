success() {
    echo "SUCCESS"
    echo "Helm chart successfully installed ${step_configuration_helmName}."
    helm ls
}

execute_command success
