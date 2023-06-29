# Kubernetes Infrastructure for Aperture science

This repository contains terraform definitions for 6 clusters that are used in the aperture science demo Codefresh account.

All 6 clusters are virtual (see vcluster.com)

The clusters are split into 2 groups

## Group A - Virtual clusters connected to the SAAS hosted runtime

These are `kc-v-prod`,`kc-v-qa`,`kc-v-staging`

These clusters are

* connected as managed clusters to `codefresh-hosted` runtime
* are externally accessible the full DNS names
* can only be used for deploying applications

## Group B - Virtual clusters that contain Codefresh runtimes

These are `prod-vcluster`,`qa-vcluster`,`staging-vcluster`

These clusters:

* connected one GitOps runtime each
* are NOT externally accessible 
* can be used for deploying applications and running Argo Workflows


## Accessing and debugging the virtual clusters

Download to your workstation the [aws cli](https://aws.amazon.com/cli/) and the [vcluster cli](https://www.vcluster.com/docs/getting-started/setup)

Get your AWS credential from the AWS SSO application in your Codefresh account

The in a terminal execute

```shell
aws eks --region us-east-1 update-kubeconfig --name kubecon-dev
```

You now have access to the parent/real cluster that contains all the virtual clusters

To access individual clusters from group A

Execute

```shell
vcluster connect target-vcluster-prod -n target-vcluster-prod  --server=https://prod.kubecon.sales-dev.codefresh.io
vcluster connect target-vcluster-qa -n target-vcluster-qa  --server=https://qa.kubecon.sales-dev.codefresh.io
vcluster connect target-vcluster-staging -n target-vcluster-staging  --server=https://staging.kubecon.sales-dev.codefresh.io
```

Note that each command will permanently change your local kubeconfig file to that of the virtual cluster. Use the command `vcluster disconnect` to change your kubecontext back to the parent/real cluster

To access individual clusters from group B

Execute

```shell
vcluster connect qa-vcluster -n vcluster-qa
vcluster connect prod-vcluster -n vcluster-prod
vcluster connect stagin-vcluster -n vcluster-staging
```

Note that each command will start a port forward process. You need then to open another terminal to use `kubectl` commands to access the cluster. Press Ctrl-C to  change your kubecontext back to the parent/real cluster

## Recreating the clusters

To destroy all the clusters then install [the terraform CL](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
and run 

```shell
terraform init
terraform destroy
```


Before doing that you might want to disconnect the deployment clusters from Codefresh first and uninstall also the GitOps runtimes.

Notice that we use the Cluster itself for holding the terraform state
If you want to create the clusters again

```
terraform init
terraform apply
```

Answer yes to the question.


