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

resource "helm_release" "target_vcluster_staging" {
  name             = "target-vcluster-staging"
  namespace        = "target-vcluster-staging"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster"
  version          = "0.11.2"

  values = [
    file("${path.module}/manifests/deployment_clusters/vcluster-staging-values.yml")
  ]
}


resource "helm_release" "target_vcluster_qa" {
  name             = "target-vcluster-qa"
  namespace        = "target-vcluster-qa"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster"
  version          = "0.11.2"

  values = [
    file("${path.module}/manifests/deployment_clusters/vcluster-qa-values.yml")
  ]
}


resource "kubernetes_manifest" "prod_ingress" {
  depends_on = [
    helm_release.target_vcluster_prod
  ]
  manifest = yamldecode(file("manifests/ingresses/vcluster-prod-ing.yml"))
}

resource "kubernetes_manifest" "staging_ingress" {
  depends_on = [
    helm_release.target_vcluster_staging
  ]
  manifest = yamldecode(file("manifests/ingresses/vcluster-staging-ing.yml"))
}

resource "kubernetes_manifest" "qa_ingress" {
  depends_on = [
    helm_release.target_vcluster_qa
  ]
  manifest = yamldecode(file("manifests/ingresses/vcluster-qa-ing.yml"))
}

# Create Cluster for Crossplane
resource "helm_release" "target_vcluster_crossplane" {
  name             = "target-vcluster-crossplane"
  namespace        = "target-vcluster-crossplane"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster"
  version          = "0.11.2"

  values = [
    file("${path.module}/manifests/deployment_clusters/vcluster-crossplane-values.yml")
  ]
}

resource "kubernetes_manifest" "crossplane_ingress" {
  depends_on = [
    helm_release.target_vcluster_crossplane
  ]
  manifest = yamldecode(file("manifests/ingresses/vcluster-crossplane-ing.yml"))
}