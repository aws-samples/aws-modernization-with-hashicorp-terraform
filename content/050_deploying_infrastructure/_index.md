---
title: "Deploying Infrastructure"
chapter: true
draft: false
weight: 5
---

# Deploying Infrastructure

Terraform is HashiCorp’s infrastructure as code tool. It lets you define resources and infrastructure in human-readable, declarative configuration files, and manages your infrastructure’s lifecycle. Using Terraform has several advantages over manually managing your infrastructure:

* Terraform can manage infrastructure on multiple cloud platforms.
* The human-readable configuration language helps you write infrastructure code quickly.
* Terraform's state allows you to track resource changes throughout your deployments.
* You can commit your configurations to version control to safely collaborate on infrastructure.

{{% notice note %}}
This functionality is available in the [Terraform Cloud](https://www.hashicorp.com/products/terraform/editions/enterprise), using [Team & Governance](https://www.hashicorp.com/products/terraform/pricing/) tier, as well as [Enterprise](https://www.hashicorp.com/products/terraform/editions/enterprise). Organization owners can enable a [30-day free trial](https://www.hashicorp.com/blog/announcing-free-trials-for-hashicorp-terraform-cloud-paid-offerings/) in their settings under **"Plan & Billing"**.
{{% /notice %}}