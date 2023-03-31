# terraform-vcluster
Create Virtual clusters with terraform

## Requirements

1. A Kubernetes cluster/context setup in Kubeconfig
2. The terraform CLI (required)
3. vcluster CLI (optional) if you want to verify the virtual clusters
4. helm CLI (optional) if you want to look at vclusters via Helm

Notice that we use the Cluster itself for holding the terraform state

## How to run locally

Run

```
terraform init
terraform apply
```

Answer yes to the question to generate the vcluster

You can then use `vcluster connect` if you actually want to connect to it

To delete the vcluster run

```
terraform destroy
```

## Exporting the kube config


```
terraform output kube_config | jq -r '@base64d' > ~/.kube/vc.yaml
alias vkubectl="KUBECONFIG=~/.kube/vc.yaml kubectl"
```

And then if you run vkubectl commands they will work on the virtual cluster.
