output "kube_config" {
  description = "The Kubeconfig file of the virtual cluster"
  value       = data.kubernetes_secret.vcluster_kubeconfig.data.config
  sensitive   = true
}
