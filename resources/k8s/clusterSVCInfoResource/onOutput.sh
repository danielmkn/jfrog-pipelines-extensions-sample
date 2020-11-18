save_cluster_services_data() {
  echo "Environment variables for helmInstallResource:"
  printenv

  echo "Cluster services info"
  echo "Load balancer external IP: " $LB_IP

  write_output clusterSVCInfoResource loadBalancerIP=$LB_IP

  }

execute_command save_cluster_services_data
