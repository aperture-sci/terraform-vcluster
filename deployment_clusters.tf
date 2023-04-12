resource "helm_release" "nginx_ingress" {
  name = "ingress-nginx"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  version    = "4.6.0"
  set {
    name  = "controller.extraArgs.enable-ssl-passthrough"
    value = ""
  }
}


resource "helm_release" "target_vcluster_prod" {
  name             = "target-vcluster-prod"
  namespace        = "target-vcluster-prod"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster"
  version          = "0.11.2"

  values = [
    file("${path.module}/manifests/deployment_clusters/vcluster-prod-values.yml")
  ]
}

# resource "helm_release" "virtual_cluster_qa" {
#   name             = "qa-vcluster"
#   namespace        = "vcluster-qa"
#   create_namespace = true
#   repository       = "https://charts.loft.sh"
#   chart            = "vcluster"
#   version          = "0.11.2"
# }


# resource "helm_release" "virtual_cluster_staging" {
#   name             = "staging-vcluster"
#   namespace        = "vcluster-staging"
#   create_namespace = true
#   repository       = "https://charts.loft.sh"
#   chart            = "vcluster"
#   version          = "0.11.2"
# }
