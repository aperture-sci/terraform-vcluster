resource "helm_release" "virtual_cluster_prod" {
  name             = "prod-vcluster"
  namespace        = "vcluster-prod"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster-k8s"
  version          = "0.11.2"
}

resource "helm_release" "virtual_cluster_qa" {
  name             = "qa-vcluster"
  namespace        = "vcluster-qa"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster-k0s"
  version          = "0.11.2"
}


resource "helm_release" "virtual_cluster_staging" {
  name             = "staging-vcluster"
  namespace        = "vcluster-staging"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster-k8s"
  version          = "0.11.2"
}


