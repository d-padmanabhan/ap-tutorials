################################################################################
# VPC
################################################################################
resource "aws_vpc" "main" {
  cidr_block = "10.100.0.0/20"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = local.vpc_name
  }
}

################################################################################
## DHCP Option Set and VPC Association
## https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-time.html
################################################################################
resource "aws_vpc_dhcp_options" "dhcp_option_set" {
  domain_name         = "internal.cfn.io"
  domain_name_servers = ["AmazonProvidedDNS"]
  ntp_servers         = ["169.254.169.123"]

  tags = {
    Name = "${local.vpc_name}-dhcp-option-set"
  }

  # domain_name_servers  = ["8.8.8.8", "8.8.4.4"]
  # ntp_servers          = ["time.nist.gov"]
  # netbios_name_servers = ["10.0.0.1"]
  # netbios_node_type    = 2
}

resource "aws_vpc_dhcp_options_association" "dhcp_option_set_vpc_association" {
  vpc_id          = aws_vpc.main.id
  dhcp_options_id = aws_vpc_dhcp_options.dhcp_option_set.id
}
