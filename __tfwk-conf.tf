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
