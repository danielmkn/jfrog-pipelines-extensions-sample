success() {

  local slackIntegrationName=$(get_integration_name --type "Slack")
  if [ ! -z "$slackIntegrationName" ]; then
    local notifyOnSuccess=$(find_step_configuration_value "notifyOnSuccess")
    local helmName=$(find_resource_variable helmInstallResource helmName)
    if [ -z "$notifyOnSuccess" ]; then
      notifyOnSuccess=false
    fi
    if [ "$notifyOnSuccess" == "true" ]; then
      echo "Sending success notification"
      send_notification "$slackIntegrationName" --text "WaitForPods step is complete for *$helmName* installation!"
    else
      echo "notifyOnSuccess is set to false, skipping notification"
    fi
  else
    echo "Slack integration is not added, skipping notification"
  fi
    kubectl get pods -n "$NAMESPACE"
}

execute_command success
