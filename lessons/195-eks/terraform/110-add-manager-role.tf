################################################################################
## IAM Role for EKS Admin
################################################################################
resource "aws_iam_role" "eks_admin" {
  name = "${local.product_name}-${local.eks_name}-${local.env}-eks-admin"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      }
    }
  ]
}
POLICY
}

################################################################################
## IAM Policy for EKS Admin
################################################################################
resource "aws_iam_policy" "eks_admin" {
  name = "AmazonEKSAdminPolicy"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "eks:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:PassRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:PassedToService": "eks.amazonaws.com"
                }
            }
        }
    ]
}
POLICY
}

################################################################################
## Attach EKS Admin Policy to EKS Admin Role
################################################################################
resource "aws_iam_role_policy_attachment" "eks_admin" {
  role       = aws_iam_role.eks_admin.name
  policy_arn = aws_iam_policy.eks_admin.arn
}

################################################################################
## IAM Policy for EKS Assume Admin
################################################################################
resource "aws_iam_policy" "eks_assume_admin" {
  name = "AmazonEKSAssumeAdminPolicy"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": "${aws_iam_role.eks_admin.arn}"
        }
    ]
}
POLICY
}

# ################################################################################
# ## IAM User for Manager
# ################################################################################
# resource "aws_iam_user" "manager" {
#   name = "manager"
# }

# ################################################################################
# ## Attach EKS Assume Admin Policy to Manager User
# ################################################################################
# resource "aws_iam_user_policy_attachment" "manager" {
#   user       = aws_iam_user.manager.name
#   policy_arn = aws_iam_policy.eks_assume_admin.arn
# }

# ################################################################################
# ## Best practice: use IAM roles due to temporary credentials
# ## Add Manager to EKS Cluster with EKS Admin Role
# ################################################################################
# resource "aws_eks_access_entry" "manager" {
#   cluster_name      = aws_eks_cluster.eks.name
#   principal_arn     = aws_iam_role.eks_admin.arn
#   kubernetes_groups = ["${local.product_name}-admin"]
# }
