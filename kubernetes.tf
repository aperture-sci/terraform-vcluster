provider "kubernetes" {
  config_path    = "~/.kube/config"
#   config_context = "my-context"
}

data "kubernetes_secret" "vcluster_kubeconfig" {
  metadata {
    name      = "vc-my-vcluster"
    namespace = "vcluster-demo"
  }
}

output "kube_config_client_authority" {
  value = data.kubernetes_secret.vcluster_kubeconfig.data.certificate-authority
  sensitive = true
}

output "kube_config_client_cert" {
  value = data.kubernetes_secret.vcluster_kubeconfig.data.client-certificate
  sensitive = true
}

output "kube_config_client_key" {
  value = data.kubernetes_secret.vcluster_kubeconfig.data.client-key
  sensitive = true
}

output "kube_config" {
  value = data.kubernetes_secret.vcluster_kubeconfig.data.config
  sensitive = true
}