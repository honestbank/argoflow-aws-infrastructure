# Kubeflow Infrastructure

This repository contains code that creates the cloud infrastructure to support our Kubeflow deployment. The files are
organized by cloud provider and product/service (this might not be the best grouping so please feel free to reorganize).

Current usage is specific to [argoflow-aws](https://github.com/argoflow/argoflow-aws) so the requirements are very closely
tied to those specified in [their readme](https://github.com/argoflow/argoflow-aws/blob/master/README.md).

## Prerequisites

This module assumes that you have a vanilla EKS cluster running in a VPC with private and/or public subnets. From that point
on, this module:

* Tags the VPC and subnets
* Creates an RDS instance
* Creates a Redis Elasticache instance
* Creates IAM roles and policies and the required attachments
* Creates AWS Secrets Manager Secrets

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

>
> TODO: add variables for all application Kubernetes Service Account names (currently we make some assumptions like
> using `cert-manager` as the Service Account and Namespace for [cert-manager](https://cert-manager.io)).
>

argoflow-aws requires IAM roles for various component/supporting applications. These can be found in [iam.tf](/iam.tf).

## Authentication (`oauth2-proxy`)

argoflow-aws uses [oath2-proxy](https://github.com/oauth2-proxy/oauth2-proxy) which requires setting up an OAuth Application.
We currently use GCP for this. The settings required for [Setting up OAuth 2.0](https://support.google.com/cloud/answer/6158849) are:

* Authorized JavaScript origins: FQDN/URL (eg. `https://argoflow-aws.test.honestbank.com`)
* Authorized Redirect URIs: `https://argoflow-aws.test.honestbank.com/oauth2/callback`
