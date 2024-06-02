locals {
  product_name      = "cfn-eks"
  product_lifecycle = "sbx"
  env               = local.product_lifecycle
  region            = "us-east-1"
  az1               = "us-east-1a"
  az2               = "us-east-1b"
  eks_name          = "demo"
  eks_version       = "1.29"
  vpc_name          = "${local.product_name}-${local.env}-vpc-${local.region_short_name}"

  # A mapping of AWS region codes to shorter aliases for ease of reference and use in resource naming or tagging.
  region_short_name_lookup = {
    "us-east-1" : "use1",
    "us-west-2" : "usw2",
    "us-east-2" : "use2",
    "eu-central-1" : "euc1",
    "eu-west-1" : "euw1",
    "eu-west-2" : "euw2",
    "eu-north-1" : "eun1",
    "ap-southeast-1" : "apse1",
    "ap-southeast-2" : "apse2",
    "ca-central-1" : "cac1"
  }

  # Lookup to find the region alias based on the current AWS region.
  region_short_name = lookup(local.region_short_name_lookup, data.aws_region.current_region.name, "")

  # # Maps a number of desired availability zones to the corresponding list of AZ identifiers.
  # az_count_to_identifiers = {
  #   "1" : ["a"],
  #   "2" : ["a", "b"],
  #   "3" : ["a", "b", "c"],
  #   "4" : ["a", "b", "c", "d"],
  #   "5" : ["a", "b", "c", "d", "e"],
  #   "6" : ["a", "b", "c", "d", "e", "f"]
  # }

  # # List of Availability Zones based on the desired count.
  # azs_list = local.az_count_to_identifiers[local.azs_count]

  # Constructs the spoke VPC name using the product lifecycle, region alias, and product name.
  # spoke_vpc_name       = "vpc-${substr(local.product_lifecycle, 0, 1)}${local.region_short_name}-${local.product_name}"
  # spoke_vpc_ssm_prefix = "/vpc/${local.spoke_vpc_name}"
  # selected_azs         = slice(data.aws_availability_zones.available.names, 0, local.azs_count)

  # vpc_ipv4_cidr = "10.100.0.0/20"
  # azs_count     = 2

  # vpc_subnets = {
  #   public_a = {
  #     type       = "public"
  #     cidr_block = "10.16.32.0/22"
  #   },
  #   public_a = {
  #     type       = "public"
  #     cidr_block = "10.16.36.0/22"
  #   },
  #   private_a = {
  #     type       = "private"
  #     cidr_block = "10.16.40.0/22"
  #   },
  #   private_b = {
  #     type       = "private"
  #     cidr_block = "10.16.44.0/22"
  #   }
  # }

  # vpc_subnets_expanded = {
  #   for key, subnet in local.vpc_subnets :
  #   key => {
  #     type       = subnet.type
  #     cidr_block = try(subnet.cidr_block, cidrsubnet(local.vpc_ipv4_cidr, 4, index(keys(local.vpc_subnets), key)))
  #     node_count = try(subnet.node_count, null)
  #   }
  # }

  # subnet_keys = keys(local.vpc_subnets_expanded)
}
