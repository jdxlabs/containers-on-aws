# Container orchestration on AWS (EKS, ECS and Nomad)

This lab will create you each of this tools so you can begin to play with it.

Don't forget to destroy at the end. ;)


## Requirements

* Terraform v0.13.5


## Commands to follow the workshop

```
cp terraform/env.tfvars.dist terraform/env.tfvars
# and customize with your own variables

terraform init terraform/layers/01-network
terraform apply \
    -var-file=terraform/env.tfvars \
    -state=terraform/tfstates/01-network.tfstate \
    terraform/layers/01-network

terraform init terraform/layers/02-eks
terraform apply \
    -var-file=terraform/env.tfvars \
    -state=terraform/tfstates/02-eks.tfstate \
    terraform/layers/02-eks

```
