module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 17.0"

  cluster_name                   = "test-eks-cluster"
  cluster_version                = "1.29"
  cluster_endpoint_public_access = true
  vpc_id                         = module.vpc.vpc_id
  subnets                        = module.vpc.private_subnets
  enable_irsa                    = true

  node_groups = {
    default = {
      desired_capacity = 1
      min_capacity     = 1
      max_capacity     = 1
      instance_types   = ["t3.medium"] # Use a proper instance type
    }
  }

}
