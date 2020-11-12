# Data that must be gathered from AWS for the deployment to work.
data "aws_availability_zones" "available" {
  state = "available"
}

# Find the details for the internal VPC at AWS.
data "aws_vpc" "internal_vpc" {
  filter {
    name = "tag:Name"
    values = [
      "RD-Platform-Prod-US-East-1"
    ]
  }
}

# Find all of the subnet IDs from the internal VPC.
data "aws_subnet_ids" "internal_subnets" {
  vpc_id = data.aws_vpc.internal_vpc.id
}

# Get the latest non-beta RHEL 8 image in AWS provided by Cloud Access.
data "aws_ami" "rhel8_latest" {
  executable_users = ["self"]
  most_recent      = true
  # Exclude any beta images.
  name_regex = "^RHEL-8[.0-9]+_HVM-[0-9]{8}.*$"
  # Red Had Cloud Access account.
  owners = ["309956199498"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
