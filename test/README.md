# argoflow-aws Terraform Component Module Testing Info

TL;DR: Testing is hard. This module has no tests yet.

Testing is currently nonexistent on this module. Yes, I am ashamed. However given the current module structure,
the  required inputs (the bootstrapping) is a nontrivial process. Before running this module, the EKS cluster and the
corresponding VPCs must have been created.

The upstream infrastructure for these modules is not completely open source, which makes providing a bootstrap process
that works outside of the Honest environment slightly challenging. While our EKS ([terraform-aws-eks](https://github.com/honestbank/terraform-aws-eks))
and VPC ([terraform-aws-vpc](https://github.com/honestbank/terraform-aws-vpc)) modules are public, the Kubeflow EKS cluster
is created by our internal [api-cloud-infrastructure](https://github.com/honestbank/api-cloud-infrastructure) which
wraps/treats the terraform-aws-eks](https://github.com/honestbank/terraform-aws-eks) as a primitive.

To validate the functionality of this module, use the [wrapper provided](/argoflow-aws-infrastructure-wrapper.tf) and connect
it to a [free] [Terraform Cloud](https://app.terraform.io) workspace. Make sure to change the remote backend provider
info (eg. the `organization`) in [providers.tf](/providers.tf).
