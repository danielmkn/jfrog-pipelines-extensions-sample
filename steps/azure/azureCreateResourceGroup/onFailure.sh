failure() {
  local slackIntegrationName=$(get_integration_name --type "Slack")
  if [ ! -z "$slackIntegrationName" ]; then
    local notifyOnSuccess=$(find_step_configuration_value "notifyOnSuccess")
    local azureResourceGroup=$(find_step_configuration_value "azureResourceGroup")
    if [ -z "$notifyOnSuccess" ]; then
      notifyOnSuccess=false
    fi
    if [ "$notifyOnSuccess" == "true" ]; then
      echo "Sending success notification"
      send_notification "$slackIntegrationName" --text "*Failed* to create Azure resource group *${azureResourceGroup}*"
    else
      echo "notifyOnSuccess is set to false, skipping notification"
    fi
  else
    echo "Slack integration is not added, skipping notification"
  fi
}

execute_command failure
