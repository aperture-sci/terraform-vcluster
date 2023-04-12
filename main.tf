terraform {

  backend "kubernetes" {
    secret_suffix = "state"
    config_path   = "~/.kube/config"
  }



}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }

}
provider "kubernetes" {
  config_path = "~/.kube/config"
  #   config_context = "my-context"
}





