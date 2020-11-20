
data "aws_availability_zones" "available" {
  state = "available"
}

data "terraform_remote_state" "network" {
  backend = "local"
  config = {
    path = "terraform/tfstates/01-network.tfstate"
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks_cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks_cluster.cluster_id
}