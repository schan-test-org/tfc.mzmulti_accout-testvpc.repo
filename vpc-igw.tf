
############################# local : vpc-igw  #####################################
locals {
  create_vpc = var.vpc_id == "" ? true : false
  create_igw = local.create_vpc

  vpc_name = format("%s-vpc-eks", var.env)
  vpc_id   = local.create_vpc ? aws_vpc.vpc[0].id : var.vpc_id

  igw_name = format("%s-vpc-eks-igw", var.env)

}

############################# resource: vpc-igw  ##################################

resource "aws_vpc" "vpc" {
  count = local.create_vpc ? 1 : 0

  cidr_block = var.vpc_cidr

  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(local.common_tags, { "Name" = local.vpc_name })
}

resource "aws_internet_gateway" "igw" {
  count      = local.create_igw ? 1 : 0
  vpc_id     = aws_vpc.vpc[count.index].id
  tags       = merge(local.common_tags, { "Name" = local.igw_name })
  depends_on = [aws_vpc.vpc]
}

############################# output : vpc-igw  ##################################

output "vpc_id" {
  value = local.vpc_id
}

output "igw_id" {
  # value = local.create_igw == false && length(data.aws_internet_gateway.igw) > 0 ? data.aws_internet_gateway.igw[0].id : aws_internet_gateway.igw[0].id
  value = aws_internet_gateway.igw[0].id

}

output "vpc_tags" {
  value = data.aws_vpc.vpc.tags
}

output "igw_tags" {
  value = data.aws_internet_gateway.igw.tags
}


