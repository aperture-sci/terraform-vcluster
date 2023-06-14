resource "helm_release" "virtual_cluster_prod" {
  name             = "prod-vcluster"
  namespace        = "vcluster-prod"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster"
  version          = "0.11.2"
}

resource "helm_release" "virtual_cluster_qa" {
  name             = "qa-vcluster"
  namespace        = "vcluster-qa"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster"
  version          = "0.11.2"
}


resource "helm_release" "virtual_cluster_staging" {
  name             = "staging-vcluster"
  namespace        = "vcluster-staging"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster"
  version          = "0.11.2"
}

resource "helm_release" "eks_test" {
  name             = "eks-vcluster"
  namespace        = "vcluster-eks"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster-eks"
  version          = "0.11.2"
}

resource "helm_release" "k0s_test" {
  name             = "k0s-vcluster"
  namespace        = "vcluster-k0s"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster-k0s"
  version          = "0.11.2"
}


resource "helm_release" "k8s_test" {
  name             = "k8s-vcluster"
  namespace        = "vcluster-k8s"
  create_namespace = true
  repository       = "https://charts.loft.sh"
  chart            = "vcluster-k8s"
  version          = "0.11.2"
}
