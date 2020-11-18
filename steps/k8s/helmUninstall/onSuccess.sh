success() {
    echo "SUCCESS"
    echo "Helm chart successfully uninstalled ${step_configuration_helmName}."
    helm ls
}

execute_command success
