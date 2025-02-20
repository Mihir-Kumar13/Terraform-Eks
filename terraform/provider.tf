provider "aws" {
  region = var.region
}
# # Fetch EKS cluster details
# data "aws_eks_cluster" "this" {
#   name = module.eks.cluster_name
# }

# # Fetch authentication token for the cluster
# data "aws_eks_cluster_auth" "this" {
#   name = module.eks.cluster_name
# }


# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.this.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.this.token
# }
