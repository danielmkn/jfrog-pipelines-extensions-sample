run_kubectl_command() {
  echo "onExecute step"
    ls -al
    printenv
    echo "##### TEST #####"
    echo "%%context.machine-type%%"


}

execute_command run_kubectl_command
