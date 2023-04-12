terraform {

  backend "kubernetes" {
    secret_suffix = "state"
    config_path   = "~/.kube/config"
  }
  required_providers {
    kustomization = {
      source  = "kbst/kustomization"
      version = "0.9.0"
    }
  }


}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }

}






