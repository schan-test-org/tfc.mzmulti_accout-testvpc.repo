############################# data : resource #######################################

############################# vpc-igw : data ##################################
data "aws_vpc" "vpc" {
  id         = local.vpc_id
  depends_on = [aws_vpc.vpc]
}

data "aws_internet_gateway" "igw" {
  # count = local.create_igw ? 0 : 1

  filter {
    name   = "attachment.vpc-id"
    values = [local.vpc_id]
  }
  depends_on = [aws_vpc.vpc, aws_internet_gateway.igw]
}

