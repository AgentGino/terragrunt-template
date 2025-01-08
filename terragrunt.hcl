locals {
  # Get the directories from current path
  path_components = split("/", path_relative_to_include())
  # Get region from the path
  aws_region = element(local.path_components, length(local.path_components) - 1)
  
  # Get environment from command line var-file flag
  tfvars_file = get_env("TFVARS_FILE", "")
  env = trimspace(trimsuffix(basename(get_env("TFVARS_FILE", "dev.tfvars")), ".tfvars"))
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"
}
EOF
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "qwik-tools-terraform-backend-terraform-state"
    key            = "${path_relative_to_include()}/${local.env}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-backend-terraform-locks"
    profile        = "default"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}