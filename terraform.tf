# Base settings for terraform go here.
terraform {
    # Exit with an error if someone is running old terraform.
    required_version = ">= 0.13.5"

    # AWS backends for state storage and locks.
    backend "s3" {
        region = "us-east-1"

        # Store the terraform state in S3.
        bucket = "imagebuilder-terraform-state"
        key = "global/s3/terraform.tfstate"

        # Terraform will add a lock when running so that two instance of
        # terraform never run at the same time.
        dynamodb_table = "imagebuilder-terraform-locks"
    }
}
