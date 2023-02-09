############################################
# version of terraform and providers
############################################
terraform {
  cloud {
    organization = "schan-mz"

    workspaces {}
  }
}

# terraform {
#   cloud {
#     organization = "schan-mz"

#     workspaces {
#       name = ""
#       prefix = "mz-"  

#     }
#   }
# }

############################################
# AWS Provider Configuration
############################################
provider "aws" {
  region  = var.aws_region
  # profile = var.aws_profile
  access_key = try(var.env, "") == "dev" ? var.dev_access_key : var.qa_access_key
  secret_key = try(var.env, "") == "dev" ? var.dev_secret_key : var.dev_secret_key
  ignore_tags {
    key_prefixes = ["kubernetes.io", "k8s.io"]
  }

}