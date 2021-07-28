---
title: "Control Costs with Policies"
chapter: false
weight: 16
---
---

Terraform Cloud estimates costs for many resources found in your Terraform
configuration. It displays an hourly and monthly cost for each resource, and the monthly delta. It also totals the cost and delta of all estimatable
resources.

In this tutorial, you will enable cost estimation and define policy to check whether the total monthly delta is less than one hundred dollars a month.

{{% notice note %}}
This functionality is available in the Terraform Cloud [Team & Governance](https://www.hashicorp.com/products/terraform/pricing/) tier, as well as [Enterprise](https://www.hashicorp.com/products/terraform/pricing/). Organization owners can enable a [30-day free trial](https://www.hashicorp.com/blog/announcing-free-trials-for-hashicorp-terraform-cloud-paid-offerings/) in their settings under **"Plan & Billing"**. Cost estimates are not available for workspaces using versions of Terraform less than 0.12.0.
{{% /notice %}}

## Prerequisites

For this tutorial you will need:

- A Terraform Cloud Team & Governance tier account or a Terraform Enterprise account
- A [GitHub account](https://github.com/)
- An [AWS account to create example resources](https://aws.amazon.com/)

You should also be familiar with how to [create](2-cloud-workspace-create.md) and [destroy](5-cloud-destroy.md#delete-the-workspace-optional) Terraform Cloud workspaces.

{{% notice warning %}}
Do not apply this policy to a production workspace as it may impact your production environment.
{{% /notice %}}

{{% notice note %}}
Terraform Cloud will not estimate cost on runs or applies [targeted against a subset of resources](https://www.terraform.io/docs/cli/commands/plan.html#resource-targeting).
{{% /notice %}}

## Fork the sample repository

Fork the [sample repository](https://github.com/hashicorp/learn-sentinel-tfc), which contains an example Terraform configuration to provision an EC2 instance.

![Fork learn-sentinel-tfc repository](/images/hashicorp/terraform/github_hashicorp_learn-sentinel-tfc_fork.png)

Navigate to the `versions.tf` file in **your fork** of the repository in the Github web UI, and click the pencil icon in the top right corner.

![Edit versions.tf file in Github](/images/hashicorp/terraform/github_learn-sentinel-tfc_blob_master_versions_file.png)

In the backend configuration block, replace `"<YOUR_TERRAFORM_ORG>"` with the name of your Terraform Cloud organization. Commit the change.

## Create a Terraform Cloud workspace

Navigate to your Terraform Cloud organization and create a new VCS-backed
workspace connected to your fork of the `learn-sentinel-tfc` repository.

{{% notice note %}}
If you completed the [Upload Your Sentinel Policy Set to Terraform Cloud tutorial](zz-/sentinel-cloud-integration.md), you may already have a workspace for this configuration. Feel free to use it.
{{% /notice %}}

## Configure workspace variables

1. Navigate to your `learn-sentinel-tfc` workspace's **"Variables"** page
2. Define a variable called `instance_type` and set the value to `t2.large`.
3. Define environment variables for your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. Be sure to set both as `sensitive`.

When complete, your variable definitions will match the following:

![Terraform Cloud workspace variables](/images/hashicorp/terraform/tfc_hashicorp-training_workspaces_learn-sentinel-tfc_variables.png)

## Verify costs using policies

To verify cost estimates using policies, you need to define your policy and update your policy set.

Create a fork of the [example repository](https://github.com/hashicorp/learn-terraform-cost-estimation), which contains a Sentinel policy that flags any resource changes that increase costs by greater than \$100.

The `sentinel.hcl` file in this repository declares the new policy in your policy set. Note that the `enforcement_level` is set to `soft-mandatory`: this allows team members with explicitly set permission to override the policy check and logs and overrides.

```sentinel
policy "less-than-100-month" {
  enforcement_level = "soft-mandatory"
}
```

The `less-than-100-month.sentinel` file contains the policy definition.

```sentinel
import "tfrun"
import "decimal"

delta_monthly_cost = decimal.new(tfrun.cost_estimate.delta_monthly_cost)

main = rule {
    delta_monthly_cost.less_than(100)
}
```

This policy uses the [tfrun](https://www.terraform.io/docs/cloud/sentinel/import/tfrun.html) import to check that the cost delta for a Terraform run is no more than \$100. The `decimal` import is used for more precise calculations when working with currency numbers.

Terraform Cloud will run checks for policies defined in `sentinel.hcl` in all workspaces associated with the policy set.

## Create a policy set

In Terraform Cloud, navigate to **"Settings" > "Policy Sets"** and select **"Connect a new policy set"**. Configure **your fork** of the `learn-terraform-cost-estimation` repository as the source.

{{% notice tip %}}
The search bar for policy repositories is case sensitive.
{{% /notice %}}

In Terraform Cloud, you can apply policy sets either across your organization, or to specific workspaces.

On the **"Configure Settings"** page:

1. Select **"Policies enforced on selected workspaces"** under **"Scope of Policies"**
2. Select your `learn-sentinel-tfc` workspace and click the purple **"Add workspace button"**
3. Click **"Connect policy set"**

![Configure policy set workspaces](/images/hashicorp/terraform/tfc_hashicorp-training_settings_configure_policy_set.png)

## Trigger a run

{{% notice tip %}}
For a full list of supported resources in Terraform Cloud cost estimation, refer to the [AWS](https://www.terraform.io/docs/cloud/cost-estimation/aws.html) Cost Estimation Documentation.
{{% /notice %}}

Navigate to your `learn-sentinel-tfc` workspace. Select **"Start new plan"** from the **"Actions"** menu, and run the default **"Plan (most common)"** option.

![Start a Terraform Cloud plan run](/images/hashicorp/terraform/tfc_hashicorp-training_workspaces_learn-sentinel-tfc_start_plan.png)

## View cost estimate

After queueing a new run, Terraform Cloud will estimate changes to your
resource costs and display them in the run UI. There you will find the list of resources, their price details, and the list of un-estimated resources. You will also find the new total to determine the proposed overall monthly cost once the run is applied.

In this case, the new resource definition satisfies the Sentinel policy check you defined.

{{% notice note %}}
This is just an estimate; some resources do not have cost information available or have unpredictable usage-based pricing.
{{% /notice %}}

![Terraform Cloud cost estimation Sentinel check passed](/images/hashicorp/terraform/tfc_hashicorp-training_workspaces_learn-sentinel-tfc_cost_estimate_passed.png)

Click **"Discard run"** to cancel the run.

## Delete the policy set

Navigate back to your policy set under **"Settings" > "Policy Sets"**. Under workspaces, click **"Delete policy set"**. Confirm by clicking **"Yes, delete policy set"**.

![Delete Terraform Cloud policy set](/images/hashicorp/terraform/tfc_hashicorp-training_settings_policy-sets_delete.png)

## Delete workspace

If you do not plan on exploring other tutorials in this collection, you can
delete the workspace you created. Terraform Cloud does not charge per workspace, so you are free to leave it if you would like.

Under your workspace's **"Settings"** menu, select the **"Destruction and Deletion"** option and then delete the workspace.

## Next steps

Congratulations - you have enabled cost estimation and used it in a policy check! This provides another tool to manage your infrastructure spending.

To learn more about cost estimation, refer to the [Cost Estimation documentation](https://www.terraform.io/docs/cloud/cost-estimation/index.html).

If you would like to learn more about Terraform Cloud, refer to the following resources:

- Read the [Terraform Cloud documentation](https://www.terraform.io/docs/cloud/index.html)
- Learn about the [free and paid features of Terraform Cloud](https://www.terraform.io/docs/cloud/overview.html)
- Learn more about [Cost Estimation Documentation](https://www.terraform.io/docs/cloud/cost-estimation/index.html)
- Read the [Run States Documentation](https://www.terraform.io/docs/cloud/run/states.html).
