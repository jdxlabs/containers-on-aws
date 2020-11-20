
module "playoff-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "playoff-cluster"
  cluster_version = "1.17"
  subnets         = data.terraform_remote_state.network.outputs.public_azs.public_subnet_ids
  vpc_id          = data.terraform_remote_state.network.outputs.vpc_id

  worker_groups = [
    {
      instance_type = "m4.large"
      asg_max_size  = 5
    }
  ]
}



