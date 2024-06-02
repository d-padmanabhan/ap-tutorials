################################################################################
## IAM Role for the EKS Cluster
################################################################################

resource "aws_iam_role" "eks_role" {
  name = "${local.product_name}-${local.eks_name}-${local.env}-eks-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      }
    }
  ]
}
POLICY
}

###############################################################################
# Attach the AmazonEKSClusterPolicy managed policy to the EKS Cluster IAM Role
###############################################################################
resource "aws_iam_role_policy_attachment" "eks_role_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}

################################################################################
## EKS Cluster
################################################################################
# resource "aws_eks_cluster" "eks" {
#   name     = "${local.eks_name}-${local.env}-${local.eks_version}-${local.region_short_name}"
#   version  = local.eks_version
#   role_arn = aws_iam_role.eks_role.arn

#   vpc_config {
#     # Enable private endpoint access for the EKS cluster
#     endpoint_private_access = false
#     # Enable public endpoint access for the EKS cluster
#     endpoint_public_access = true

#     subnet_ids = [
#       aws_subnet.private_az1.id,
#       aws_subnet.private_az2.id
#     ]
#   }

#   # Configuration block for the cluster access settings
#   access_config {
#     # Authentication mode for accessing the cluster API
#     authentication_mode = "API"
#     # Grant admin permissions to the user who created the cluster
#     bootstrap_cluster_creator_admin_permissions = true
#   }

#   depends_on = [aws_iam_role_policy_attachment.eks_role_policy_attachment]
# }
