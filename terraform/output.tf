output "eks_cluster_id" {
  value = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  value = module.eks.cluster_arn
}

output "eks_cluster_version" {
  value = module.eks.cluster_version
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
