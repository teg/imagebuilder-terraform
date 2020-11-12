# AWS-specific configurations that are used throughout the deployment.
provider "aws" {
  region                  = "us-east-1"
  profile                 = "imagebuilder"
  shared_credentials_file = "~/.aws/credentials"
}

resource "aws_s3_bucket" "terraform-state" {
  bucket = "imagebuilder-terraform-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name         = "Image Builder Terraform State Storage"
    ServiceOwner = "Image Builder"
    AppCode      = "IMGB-001"
  }
}

resource "aws_dynamodb_table" "terraform-locks" {
  name         = "imagebuilder-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name         = "Image Builder Terraform Locking"
    ServiceOwner = "Image Builder"
    AppCode      = "IMGB-001"
  }
}
