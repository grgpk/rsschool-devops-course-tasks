variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "aws_bucket" {
  type    = string
  default = "rs-devops-terraform-backend"
}

variable "aws_oidc_provider" {
  description = "Will be passed from github secret"
  type        = string
}
