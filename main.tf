terraform {

  backend "kubernetes" {
    secret_suffix    = "state"
    config_path      = "~/.kube/config"
  }


  required_providers {
    codefresh = {
      source = "codefresh-io/codefresh"
      version = "0.3.1"
    }
  }
}


provider "codefresh" {
  api_url = var.api_url # or `CODEFRESH_API_URL`
  token = var.cf_token # or `CODEFRESH_API_KEY`
}



