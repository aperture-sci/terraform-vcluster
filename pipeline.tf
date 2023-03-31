resource "codefresh_project" "example-project" {
  name = "infra"

  tags = [
    "vcluster",
    "terraform-gen"
  ]
}

