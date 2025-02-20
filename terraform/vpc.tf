module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5"

  name = "my-eks-vpc"
  cidr = var.vpc_cidr

  tags = {
    name = "my-eks-vpc"
  }

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}