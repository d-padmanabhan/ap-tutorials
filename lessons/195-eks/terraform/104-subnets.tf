################################################################################
# Subnets
################################################################################
resource "aws_subnet" "public_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.100.0.0/22"
  availability_zone       = local.az1
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                      = "${local.vpc_name}-public-${local.az1}"
    "kubernetes.io/role/elb"                                    = "1"
    "kubernetes.io/cluster/${local.vpc_name}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.100.4.0/22"
  availability_zone       = local.az2
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                      = "${local.vpc_name}-public-${local.az2}"
    "kubernetes.io/role/elb"                                    = "1"
    "kubernetes.io/cluster/${local.vpc_name}-${local.eks_name}" = "owned"
  }
}


resource "aws_subnet" "private_az1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.100.8.0/22"
  availability_zone = local.az1

  tags = {
    "Name"                                                      = "${local.vpc_name}-private-${local.az1}"
    "kubernetes.io/role/internal-elb"                           = "1"
    "kubernetes.io/cluster/${local.vpc_name}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "private_az2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.100.12.0/22"
  availability_zone = local.az2

  tags = {
    "Name"                                                      = "${local.vpc_name}-private-${local.az2}"
    "kubernetes.io/role/internal-elb"                           = "1"
    "kubernetes.io/cluster/${local.vpc_name}-${local.eks_name}" = "owned"
  }
}

