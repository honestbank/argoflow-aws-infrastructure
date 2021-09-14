# Kubeflow Infrastructure

This repository contains code that creates the cloud infrastructure to support our Kubeflow deployment. The files are
organized by cloud provider and product/service (this might not be the best grouping so please feel free to reorganize).

Current usage is specific to [argoflow-aws](https://github.com/argoflow/argoflow-aws) so the requirements are very closely
tied to those specified in [their readme](https://github.com/argoflow/argoflow-aws/blob/master/README.md).

## EKS

The EKS is build is handled by [api-cloud-infrastructure](https://github.com/honestbank/api-cloud-infrastructure). Some outputs
from [that set of Terraform Cloud workspaces](https://app.terraform.io/app/honestbank/workspaces?tag=compute) match up to
some required inputs of this repo/module.

## RDS

An RDS instance is provisioned for various purposes. At the time of writing this doc, these are:

```gotemplate
<<__rds.db_name.cache__>>=cachedb
<<__rds.db_name.pipelines__>>=mlpipeline
<<__rds.db_name.metadata__>>=metadb
<<__rds.db_name.katib__>>=katib
<<__rds.db_name.mlflow__>>=mlflow
```

>
> **TECH DEBT/SECURITY VULNERABILITY** Kubeflow uses classical username and password credentials for DB access. This module currently
> provisions a set of credentials as **kubeflow/kubeflow**. Since this is currently a POC, the credential strategy is left
> for future work (next sprint).
>

### Inputs

The RDS needs to be provisioned into the same VPC as the Kubeflow EKS instance. This requires the following input variables:

* The VPC subnet IDs (at least 2 subnets)
* The VPC Security Group IDs (to enable communication with the EKS nodes)

## IAM

argoflow-aws requires IAM roles for various component/supporting applications:

* `aws-load-balancer-controller`
* `cluster-autoscaler`
