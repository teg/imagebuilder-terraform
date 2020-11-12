# Data that must be gathered from AWS for the deployment to work.
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "internal_vpc" {
  filter {
      name = "tag:Name"
      values = [
          "RD-Platform-Prod-US-East-1"
      ]
  }
}

data "aws_subnet_ids" "internal_subnets" {
  vpc_id = data.aws_vpc.internal_vpc.id
}
