

resource "helm_release" "target_vcluster_asia" {
  name             = "target-vcluster-asia"
  namespace        = "target-vcluster-asia"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster"
  version          = "0.11.2"

  values = [
    file("${path.module}/manifests/deployment_clusters_regions/vcluster-asia-values.yml")
  ]
}

resource "helm_release" "target_vcluster_eu" {
  name             = "target-vcluster-eu"
  namespace        = "target-vcluster-eu"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster"
  version          = "0.11.2"

  values = [
    file("${path.module}/manifests/deployment_clusters_regions/vcluster-eu-values.yml")
  ]
}


resource "helm_release" "target_vcluster_usw" {
  name             = "target-vcluster-usw"
  namespace        = "target-vcluster-usw"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster"
  version          = "0.11.2"

  values = [
    file("${path.module}/manifests/deployment_clusters_regions/vcluster-usw-values.yml")
  ]
}

resource "helm_release" "target_vcluster_use" {
  name             = "target-vcluster-use"
  namespace        = "target-vcluster-use"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster"
  version          = "0.11.2"

  values = [
    file("${path.module}/manifests/deployment_clusters_regions/vcluster-use-values.yml")
  ]
}

