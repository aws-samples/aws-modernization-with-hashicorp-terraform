---
title: "Sentinel"
chapter: true
draft: false
weight: 6
---

# Sentinel

[Sentinel](https://www.hashicorp.com/sentinel) is an embedded policy-as-code framework integrated with various HashiCorp products. It enables fine-grained, logic-based policy decisions, and can be extended to use information from external sources. Terraform Cloud enables users to enforce policies during runs.

A policy consists of:

- The policy controls defined as code
- An enforcement level that changes how a policy affects the run lifecycle

{{% notice note %}}
This functionality is available in the Terraform Cloud [Team & Governance](https://www.hashicorp.com/products/terraform/pricing/) tier, as well as [Enterprise](https://www.hashicorp.com/products/terraform/pricing/). Organization owners can enable a [30-day free trial](https://www.hashicorp.com/blog/announcing-free-trials-for-hashicorp-terraform-cloud-paid-offerings/) in their settings under **"Plan & Billing"**.
{{% /notice %}}
