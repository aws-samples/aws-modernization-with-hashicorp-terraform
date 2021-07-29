---
title: "Sign up for Terraform Cloud"
chapter: false
weight: 10
---
---

In this tutorial, you will learn about how Terraform Cloud enables collaboration. Then, you will sign up for a Terraform Cloud account and create an organization.

## What is Terraform Cloud?

[Terraform Cloud](https://www.terraform.io/cloud) is an application that manages Terraform runs in a consistent and reliable
environment instead of on your local machine. It stores shared state and secret data, and connects to version control systems so that you and your team can work on infrastructure as code within your usual code workflow. It also has a private registry for sharing Terraform modules.

**Paid features** include **access controls** for approving changes to infrastructure, **detailed policy controls** for governing the contents of Terraform configurations, and **more**.

For more details on the Terraform Cloud tiers, visit the [feature overview](https://www.terraform.io/docs/cloud/overview.html) and [AWS Marketplace pricing page](https://aws.amazon.com/marketplace/pp/prodview-hc45vce44fstk).

![Terraform Cloud Overview](/images/hashicorp/terraform/cloud/overview.png)

### The VCS-driven workflow

A workspace is the basic unit of Terraform Cloud infrastructure configuration. A workspace contains Terraform configuration files, environment variables, Terraform input variables, and state files everything Terraform needs to manage a given collection of infrastructure. To manage infrastructure with Terraform Cloud, you:

1. **Write configuration** - Create or update Terraform configuration, which represents your infrastructure in HashiCorp Configuration Language (HCL).
2. **Commit changes to version control** - Check your configuration files into a version control system (VCS) as the source of truth for your configuration.
3. **Select a workspace** - Connect the VCS repo containing your configuration to a new or existing Terraform Cloud workspace.
4. **Configure variables** - Define your workspace's Terraform variables and environment variables. These are any values you want your configuration's end users to customize, and credentials or other sensitive values.
5. **Plan & apply** - Execute Terraform Cloud runs (plans and applies) to manage your infrastructure. You can trigger these via the Terraform Cloud UI or by opening pull requests in your VCS.

Since Terraform Cloud supports multiple users, you can collaborate with your team on each of these steps. For instance, each time you plan a new change, your team can review and approve the plan before it is applied.

{{% notice tip %}}
You can also use Terraform Cloud as a remote state backend for the CLI using local configuration and variables.
{{% /notice %}}

## Create an account

Visit [https://app.terraform.io/signup/account](https://app.terraform.io/signup/account) and follow the prompts to create a free Terraform Cloud account.

{{% notice note %}}
If you already have a Terraform Cloud account, go to to the [next step](#create-an-organization).
{{% /notice %}}

![Create a Terraform Cloud Account](/images/hashicorp/terraform/cloud/sign-up.png)

When you sign up, you will receive an email asking you to confirm your email address. Confirm your email address before moving on. When you click the link to confirm your email address, the Terraform Cloud UI will ask which setup workflow you would like use. Select **"Start from scratch"**.

![Select "Start from scratch" for your setup workflow in the Terraform Cloud web UI.](/images/hashicorp/terraform/cloud/setup-workflow.png)

## Create an organization

The next screen will prompt you to create a new organization. Your organization is free, and the members you add will be able to collaborate on your workspaces and share private modules.

Enter an organization name and email address. You can use the same email
address that you used for your account.

{{% notice note %}}
If you want to join an existing organization, give the organization's administrator the email address you used to create an account. They will be able to send you an invite.
{{% /notice %}}

![Create Organization](/images/hashicorp/terraform/cloud/new-organization.png)

Then click **"Create organization"**. Terraform Cloud will prompt you to create a new workspace. The [Create a Workspace](2-cloud-workspace-create.html) tutorial will guide you through to creating a new workspace and connecting it to a version control repository.

## Next Steps

In this tutorial, you created a Terraform Cloud account and organization. For more information about organizations and their relationship to workspaces, teams, and users, refer to the [Organizations documentation](https://www.terraform.io/docs/cloud/users-teams-organizations/organizations.html#creating-organizations).

Now that you have created an account and organization, you are ready to create a workspace and start managing infrastructure with Terraform Cloud.
