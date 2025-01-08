include "root" {
  path = find_in_parent_folders()
}

locals {
  # Parse the folder path to get the region name
  aws_region = basename(get_terragrunt_dir())
}

terraform {
  source = "../../../services/service-one"
}

# locals {
#   service_vars = read_terragrunt_config(find_in_parent_folders("config/globals.hcl"))
# }

inputs = {
    service_name = "idm"
  # Other service-level variables
}