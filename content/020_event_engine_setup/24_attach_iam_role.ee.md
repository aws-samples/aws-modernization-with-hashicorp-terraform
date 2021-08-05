---
title: "3. Attach IAM Role"
chapter: true
weight: 14
---

## Attach the IAM role to your instance

Will need

1. Follow [this deep link to find your Cloud9 EC2 instance](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Instances:search=aws-cloud9-{partnerName role}};sort=desc:launchTime)

1. Select the instance, then choose **Actions / Security / Modify IAM role**

    ![Attach IAM role](/images/setup/attachIAMrole.png)

1. Choose the role that contains your Partner Name in it.

1. Click **Save**
