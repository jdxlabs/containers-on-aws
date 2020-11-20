
data "aws_availability_zones" "available" {
  state = "available"
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "${var.env_conf.group}-${var.env_conf.region}-tfstate"
    key    = "env:/${var.env_conf.group}-${var.env_conf.env}/01-network.tfstate"
    region = "${var.env_conf.region}"
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.playoff-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.playoff-cluster.cluster_id
}