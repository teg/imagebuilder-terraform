# State and Locking

Terraform has two critical processes:

* 📷 State
* 🔒 Locking

All of this must be configured prior to using Terraform. You can run this deployment via:

```console
$ terraform init
$ terraform plan
$ terraform apply -auto-approve
```

## 📷 State

State is stored in AWS S3 and it includes everything that Terraform is
managing. By storing state in shared location, we avoid a situation where
multiple state stores clash and do not contain the same information.

## 🔒 Locking

Locks ensure that two instances of terraform cannot take action on deployments
at the same time. This prevents race conditions where conflicting changes are
applied.

## 📖 Learn more

There are plenty of good resources that talk about Terraform's state and
locking capabilities and requirements:

* [Blog post from Gruntwork]
* [Terraform: Locking]
* [Terraform: Remote State]

[Blog post from Gruntwork]: https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa
[Terraform: Remote State]: https://www.terraform.io/docs/state/remote.html
[Terraform: Locking]: https://www.terraform.io/docs/state/locking.html
