# Terraform Backend Resources

This is a cloudformation template that creates the resources needed for a terraform backend.

## Usage

```bash
sh deploy.sh
```

This will prompt you for the project name. The script will create the resources in the current region. Resources created are:

- S3 bucket
- DynamoDB table

