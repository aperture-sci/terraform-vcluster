provider "kubernetes" {
  config_path    = "~/.kube/config"
#   config_context = "my-context"
}

data "kubernetes_resource" "vcluster_kubeconfig" {
  api_version = "v1"
  kind        = "Secret"

  metadata {
    name      = "vc-demo"
    namespace = "vcluster-demo"
  }
}

output "kube_config_client_authority" {
  value = data.kubernetes_resource.vcluster_kubeconfig.object.data.certificate-authority
}

output "kube_config_client_cert" {
  value = data.kubernetes_resource.vcluster_kubeconfig.object.data.client-certificate
}

output "kube_config_client_key" {
  value = data.kubernetes_resource.vcluster_kubeconfig.object.data.client-key
}

output "kube_config" {
  value = data.kubernetes_resource.vcluster_kubeconfig.object.data.config
}