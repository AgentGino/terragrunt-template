# Terragrunt Template

This is a template for a terragrunt project.

## Project Structure

- `deployments/service-one/us-east-1/dev.tfvars` - This is the terraform.tfvars file for the service-one deployment in the us-east-1 region for the dev environment.
- `terragrunt.hcl` - This is the terragrunt.hcl file for the root terragrunt.hcl file.

## Usage

```bash
cd deployments/service-one/us-east-1
terragrunt init -var-file=dev.tfvars
terragrunt plan -var-file=dev.tfvars
terragrunt apply -var-file=dev.tfvars
```

This will create backend.tf file with the backend configuration.

```
terraform {
  backend "s3" {
    bucket         = "qwik-tools-terraform-backend-terraform-state"
    dynamodb_table = "terraform-backend-terraform-locks"
    encrypt        = true
    key            = "deployments/service-one/us-east-1/dev/terraform.tfstate"
    profile        = "default"
    region         = "us-east-1"
  }
}
```

and Provider.tf file with the provider configuration.

```
provider "aws" {
  region = "us-east-1"
}
```
