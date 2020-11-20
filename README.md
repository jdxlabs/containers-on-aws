# Container orchestration on AWS (EKS, ECS and Nomad)

This lab will create you each of this tools so you can begin to play with it.

Don't forget to destroy at the end. ;)


## Requirements

* Terraform v0.13.5
* aws-iam-authenticator
* kubectl


## Commands to follow the workshop

Create the landscape for the network
```
cp terraform/env.tfvars.dist terraform/env.tfvars
# and customize with your own variables

terraform init terraform/layers/01-network
terraform apply \
    -var-file=terraform/env.tfvars \
    -state=terraform/tfstates/01-network.tfstate \
    terraform/layers/01-network
```


Create EKS and launch the container
```
terraform init terraform/layers/02-eks
terraform apply \
    -var-file=terraform/env.tfvars \
    -state=terraform/tfstates/02-eks.tfstate \
    terraform/layers/02-eks

export KUBECONFIG=kubeconfig_ctnsonaws-sbx-eks-cluster

kubectl get all
kubectl apply -f scripts/kube-deployment.yml
```
