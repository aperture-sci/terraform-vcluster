provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }

}

resource "helm_release" "virtual_cluster" {
  name       = "my-vcluster"
  namespace   = "vcluster-demo"
  create_namespace   = true
  repository = "https://charts.loft.sh"
  chart      = "vcluster"

#   set {
#     name  = "service.type"
#     value = "ClusterIP"
#   }
}