# ################################################################################
# ## Data Sources for EKS Cluster
# ################################################################################
# ## Fetches the EKS Cluster Information

# data "aws_eks_cluster" "eks" {
#   name = aws_eks_cluster.eks.name
# }

# ################################################################################
# ## Fetches the EKS Cluster Authentication Information
# ################################################################################
# data "aws_eks_cluster_auth" "eks" {
#   name = aws_eks_cluster.eks.name
# }

# ################################################################################
# ## Helm Provider Configuration
# ################################################################################
# provider "helm" {
#   kubernetes {
#     host                   = data.aws_eks_cluster.eks.endpoint
#     cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
#     token                  = data.aws_eks_cluster_auth.eks.token
#   }
# }
