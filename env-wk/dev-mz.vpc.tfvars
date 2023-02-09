
############################################
# AWS Provider Configuration
############################################
provider "aws" {
  region  = var.aws_region
  # profile = var.aws_profile
  access_key = var.dev_access_key
  secret_key = var.dev_secret_key

  ignore_tags {
    key_prefixes = ["kubernetes.io", "k8s.io"]
  }
}

########################################
# Common
########################################
project     = "mzdev-vpc-prj"
aws_region  = "ap-northeast-2"


default_tags = {
  dept  = "Platform Service Architect Group / DevOps SWAT Team"
  email = "schan@mz.co.kr"
}

########################################
# wsk setting
########################################
env = "mzdev-vpc"

########################################
# conditions
########################################
enable_dns_hostnames = true
enable_dns_support   = true
instance_tenancy     = "default"


########################################
# VPC A-class
########################################
vpc_cidr = "10.10.0.0/16"
vpc_id   = ""

