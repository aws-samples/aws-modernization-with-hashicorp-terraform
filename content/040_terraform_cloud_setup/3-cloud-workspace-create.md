---
title: "Create a Workspace"
chapter: false
weight: 11
---
---

In this tutorial, you will create a version control system (VCS) driven Terraform Cloud workspace by connecting a sample repository to Terraform Cloud. This Terraform Cloud workspace will provision an AWS EC2 instance.

## Prerequisites

While Terraform can provision resources on many different providers and connect with several popular version control systems (VCSs), this tutorial requires:

- an [AWS account](https://aws.amazon.com/)
- a [GitHub](https://github.com/) account

## Fork a Github repository

Visit [this example GitHub repository](https://github.com/hashicorp/tfc-guide-example), which contains the Terraform configuration for an EC2 instance.

Click the **"Fork"** button at the top right of the page to copy the repository to your GitHub account.

![Use the fork button; do not clone](/images/hashicorp/terraform/cloud/fork.png)

Explore your fork of the repository. It contains Terraform configuration files, which define and expose information about your infrastructure:

- `main.tf` specifies the [AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest), a provider plugin that connects Terraform Cloud to the AWS API, and the [random provider](https://registry.terraform.io/providers/hashicorp/random/latest), another provider that will generate the random name for the table. It also defines resources that represent the table name and the table itself, with the information that AWS needs to know about the table's settings.
- `variables.tf` defines the input variables that are referenced in `main.tf`, which make the configuration easy to customize and collaborate on. You will set some of these values in the Terraform Cloud UI later on in this tutorial.
- `outputs.tf` defines the information about your infrastructure that Terraform Cloud will display to you when it makes changes.
- `versions.tf` defines version constraints for Terraform, the AWS provider, and the random provider.

## Connect Terraform Cloud to GitHub

Navigate to the **"Workspaces"** page from the main menu and click **"+ New workspace"**

![Create a new Terraform Cloud Workspace](/images/hashicorp/terraform/tfc_hashicorp-training_create_workspace.png)

On the **"New Workspace"** page, select the **"Version control workflow"** from the workflow options screen. On the "Connect to VCS" screen, press the **"GitHub"** button and then choose **"GitHub.com (Custom)"** from the drop-down to continue.

![New workspace](/images/hashicorp/terraform/cloud/connect-workspace-to-vcs.png)

A new window will open asking you to authorize Terraform Cloud to use your GitHub account. Click the green **"Authorize"** button to connect Terraform Cloud to your GitHub account.

![GitHub Authorization](/images/hashicorp/terraform/cloud/authorize-github.png)

You may be asked to install Terraform Cloud for your GitHub account or organization. If prompted, select your account or organization to install Terraform Cloud.

![Install Terraform Cloud](/images/hashicorp/terraform/cloud/install-terraform-cloud.png)

For information about installing Terraform Cloud on GitHub, refer to the [Terraform Documentation: Configuration-Free GitHub Usage](https://www.terraform.io/docs/cloud/vcs/github-app.html#installing).

## Choose a repository

Next, Terraform will display a list of your GitHub repositories. Choose the repository you forked, called "tfc-guide-example". If you have many GitHub repositories, you may need to filter the list to find the correct one.

![Connect VCS repository to Terraform Cloud Workspace](/images/hashicorp/terraform/tfc_hashicorp-training_workspaces_connect_tfc_guide_example_repository.png)

## Create the workspace

On the next screen, leave the workspace name and "Advanced options" unchanged, and click the purple **"Create workspace"** button to create the workspace.

![Configure settings](/images/hashicorp/terraform/cloud/configure-settings.png)

It will take a few minutes for Terraform Cloud to connect to your GitHub repository. Once connected, Terraform Cloud will display a notification that your configuration was uploaded successfully.

![Terraform Cloud new workspace landing page](/images/hashicorp/terraform/tfc_hashicorp-training_workspaces_tfc-guide-example_new_workspace.png)

## Next Steps

In this tutorial, you created a workspace and connected it to your GitHub repository. Read more about Terraform Cloud workspaces in the [documentation](https://www.terraform.io/docs/cloud/workspaces/index.html).

Next, you will configure your new workspace with variables and provision your infrastructure by queuing a run in Terraform Cloud.
