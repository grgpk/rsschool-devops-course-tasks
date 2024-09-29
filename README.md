# Terraform AWS Deployment with GitHub Actions

This repository contains Terraform configurations for deploying infrastructure to AWS. The deployment process is automated using GitHub Actions and the AWS OpenID Connect (OIDC) provider for secure authentication.

## Prerequisites

To use this repository, you need to have the following tools installed locally:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Git](https://git-scm.com/)

Additionally, you will need:

- AWS Account
- A GitHub repository to host the workflow
- Properly configured AWS IAM role with trust for GitHub OIDC

## Features

- **Terraform Configuration**: Defines AWS infrastructure as code.
- **GitHub Actions**: Automates Terraform plan and apply on pull requests and merges to the default branch.
- **AWS OIDC Authentication**: Securely authenticates GitHub Actions with AWS via OIDC.

## Workflow Overview

The GitHub Actions workflow is triggered on pull requests and pushes to the default branch. The workflow contains the following jobs:

1. **`terraform-check`**: Checks Terraform code formatting using `terraform fmt`.
2. **`terraform-plan`**: Runs `terraform plan` to show the changes that would be applied to the infrastructure.
3. **`terraform-apply`**: If a push is made to the default branch, this job applies the Terraform changes to AWS.
