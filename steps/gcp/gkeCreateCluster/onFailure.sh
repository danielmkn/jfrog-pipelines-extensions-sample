failure() {

  local slackIntegrationName=$(get_integration_name --type "Slack")
  if [ ! -z "$slackIntegrationName" ]; then
    local notifyOnSuccess=$(find_step_configuration_value "notifyOnSuccess")
    local gkeClusterName=$(find_step_configuration_value "gkeClusterName")
    if [ -z "$notifyOnSuccess" ]; then
      notifyOnSuccess=false
    fi
    if [ "$notifyOnSuccess" == "true" ]; then
      echo "Sending success notification"
      send_notification "$slackIntegrationName" --text "*Failed* to create GKE cluster *${gkeClusterName}*"
    else
      echo "notifyOnSuccess is set to false, skipping notification"
    fi
  else
    echo "Slack integration is not added, skipping notification"
  fi
}

execute_command failure
