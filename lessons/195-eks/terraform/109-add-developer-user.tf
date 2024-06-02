# ################################################################################
# ## IAM User for Developer
# ################################################################################
# resource "aws_iam_user" "developer" {
#   name = "developer"
# }

# ################################################################################
# ## IAM Policy for Developer EKS Access
# ################################################################################
# resource "aws_iam_policy" "developer_eks" {
#   name = "AmazonEKSDeveloperPolicy"

#   policy = <<POLICY
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "eks:DescribeCluster",
#                 "eks:ListClusters"
#             ],
#             "Resource": "*"
#         }
#     ]
# }
# POLICY
# }

# ################################################################################
# ## Attach Developer EKS Policy to Developer User
# ################################################################################
# resource "aws_iam_user_policy_attachment" "developer_eks" {
#   user       = aws_iam_user.developer.name
#   policy_arn = aws_iam_policy.developer_eks.arn
# }

# ################################################################################
# ## Add Developer to EKS Cluster with Viewer Access
# ################################################################################
# resource "aws_eks_access_entry" "developer" {
#   cluster_name      = aws_eks_cluster.eks.name
#   principal_arn     = aws_iam_user.developer.arn
#   kubernetes_groups = ["${local.product_name}-viewer"]
# }
