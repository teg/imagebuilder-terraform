# ⛅ Image Builder Terraform resources

This repostiory contains all of the Terraform resources needed to run Image
Builder within AWS.

Get started by [downloading Terraform] and following the instructions below.

[downloading Terraform]: https://www.terraform.io/downloads.html

# Development

## Keeping resources organized

Terraform resources can sprawl a bit as the deployments get more complex. It's
a good idea to organize the resources based on the things that go together.
The current resource files include:

* `data.tf`: data to gather from AWS resources that already exist
* `output.tf`: data to print after a `terraform apply` run
* `provider.tf`: deployment-wide configurations for AWS
* `terraform.tf`: deployment-wide general configuration

# Operations

## 🔒 State and locks

Terraform uses centralized state and locks to ensure consistency in
deployments. Review the [README](state-and-locks/README.md) and terraform
resources in the `state-and-locks` directory.

💣 **Deploying these resources is a one-time operation!** Making changes to
state storage and lock handling can be highly disruptive to Terraform's
operations. These resources were applied during the creation of this
repository and should not need to be changed later.
