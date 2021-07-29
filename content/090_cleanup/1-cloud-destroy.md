---
title: "Terraform Destroy"
chapter: false
weight: 1
---
---

In this tutorial, you will destroy the EC2 instance and delete your Terraform Cloud workspace.

Over the course of these tutorials, you created an EC2 instance in AWS, a Terraform Cloud workspace, and a GitHub repository.

## Destroy infrastructure

Now that you have provisioned and changed infrastructure with Terraform Cloud, the final stage of your infrastructure's lifecycle is to destroy it. Terraform Cloud allows you to destroy the infrastructure you have provisioned as a part of the standard workflow.

To destroy the infrastructure you provisioned in these tutorials, go to your workspace in the Terraform Cloud UI. Next, from the top menu, select **"Settings -> Destruction and Deletion"**.

![Terraform Cloud workspace destruction and deletion](/images/hashicorp/terraform/tfc_hashicorp-training_workspaces_tfc-guide-example_destruction_and_deletion.png)

From this page you can:

- **Queue destroy plan** destroys all infrastructure managed by the workspace.
- **Delete from Terraform Cloud** deletes your workspace from Terraform Cloud without destroying the infrastructure the workspace manages.

{{% notice note %}}
Deleting a workspace does not destroy its infrastructure. For example, if you were to delete this workspace, the AWS EC2 instance you provisioned earlier would still exist.
{{% /notice %}}

### Queue a destroy plan

Click the red **"Queue destroy plan"** button.

Terraform Cloud will prompt you to enter your workspace name before you can queue a destroy plan.

![Queue Destroy Plan](/images/hashicorp/terraform/cloud/queue-destroy-plan.png)

Enter your workspace name and queue the plan.

### Destroy the infrastructure

As it does with all plans, Terraform Cloud will ask you to "Confirm and Apply" the plan. Do so now to destroy your EC2 instance.

After a few minutes, the apply step should complete successfully.

![Terraform Cloud workspace destroy infrastructure run](/images/hashicorp/terraform/tfc_hashicorp-training_workspaces_tfc-guide-example_destroy_infrastructure.png)

Verify that Terraform destroyed the EC2 instance by visiting the [AWS web console](https://console.aws.amazon.com/) in the region where you created it. The configuration defaults to region **N. California/us-west-1**.

## Delete the AWS IAM user (optional)

If you created an AWS IAM user for these tutorials, delete or disable this user in the AWS console. Navigate to the Identity Access Management (IAM) section, and then to the user you created. Use the AWS Console to delete the user, or disable the user's access keys.

## Delete the workspace (optional)

{{% notice tip %}}
If you plan to continue to the next tutorial in this collection and your organization does not contain other workspaces, do **not** destroy the workspace created.
{{% /notice %}}

If you do not plan to run these tutorials again and want to keep your Terraform Cloud organization clean, you can delete the workspace you created. Terraform Cloud does not limit the number of workspaces you have or charge per workspace, so whether you delete the workspace is up to you.

To delete the workspace, return to the **"Settings -> Destruction
& Deletion"** page, and click the red **"Delete from Terraform Cloud"** button.

Terraform Cloud will prompt you to enter your workspace name before you can click **"Delete workspace"**. Input the workspace name and click the button to delete the workspace.

![Delete workspace](/images/hashicorp/terraform/cloud/delete-workspace.png)

## Next steps

In these tutorials you used Terraform Cloud to provision, change, and destroy infrastructure. Now you are ready to learn more about developing Terraform configurations. We recommend downloading the Terraform CLI so you can develop configurations locally. Get started with the CLI on your preferred cloud platform:

- [Terraform CLI with AWS](/030_self_guided_setup/37_install_terraform_cli.html)

At the end of the CLI tutorials you will log into Terraform Cloud via the CLI, and get practice with Terraform Cloud's CLI-driven workflow.

You can use the CLI workflow alongside the VCS workflow in these tutorials to develop infrastructure configuration locally, commit it to version control, and deploy it into production.

To explore Terraform Cloud's paid features (which you can enable with a free trial), continue to the next tutorial. These include enforcing policies with Sentinel policy-as-code, and estimating the cost of infrastructure changes.

Learn more about the concepts you used in these tutorials by [exploring the documentation](https://www.terraform.io/docs/cloud/index.html).
