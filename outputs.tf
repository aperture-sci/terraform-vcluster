# output "kube_config_prod" {
#   description = "The Kubeconfig file of the Production virtual cluster"
#   value       = data.kubernetes_secret.vcluster_kubeconfig_prod.data.config
#   sensitive   = true
# }

# output "kube_config_qa" {
#   description = "The Kubeconfig file of the QA virtual cluster"
#   value       = data.kubernetes_secret.vcluster_kubeconfig_qa.data.config
#   sensitive   = true
# }

# output "kube_config_dev" {
#   description = "The Kubeconfig file of the DEV virtual cluster"
#   value       = data.kubernetes_secret.vcluster_kubeconfig_dev.data.config
#   sensitive   = true
# }

# output "kube_config_staging" {
#   description = "The Kubeconfig file of the Staging virtual cluster"
#   value       = data.kubernetes_secret.vcluster_kubeconfig_staging.data.config
#   sensitive   = true
# }
# # 
