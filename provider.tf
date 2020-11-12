# AWS-specific configurations that are used throughout the deployment.
provider "aws" {
  region                  = "us-east-1"
  profile                 = "imagebuilder"
  shared_credentials_file = "~/.aws/credentials"
}
