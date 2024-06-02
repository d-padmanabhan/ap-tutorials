resource "aws_vpc" "main" {
  cidr_block = "10.100.0.0/20"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${local.vpc_name}"
  }
}
