---
title: "5. Install Terraform CLI"
chapter: true
weight: 19
---

To use Terraform you will need to install it. HashiCorp distributes Terraform as a [binary package](https://www.terraform.io/downloads.html). You can also install Terraform using popular package managers.

## Install Terraform

If you are using Cloud9, please follow instruction for Linux > Amazon Linux.

{{< tabs >}}
{{% tab name="Homebrew on OS X" groupId="ux" %}}

[Homebrew](https://brew.sh) is a free and open-source package management system
for Mac OS X. Install the official [Terraform
formula](https://github.com/hashicorp/homebrew-tap) from the terminal.

First, install the HashiCorp tap, a repository of all our Homebrew packages.

```shell-session
$ brew tap hashicorp/tap
```

Now, install Terraform with `hashicorp/tap/terraform`.

```shell-session
$ brew install hashicorp/tap/terraform
```

{{% notice note %}} 
This installs a signed binary and is automatically updated with
every new official release.
{{% /notice %}}

To update to the latest version of Terraform, first update Homebrew.

```shell-session
$ brew update
```

Then, run the `upgrade` command to download and use the latest Terraform version.

```shell-session
$ brew upgrade hashicorp/tap/terraform
==> Upgrading 1 outdated package:
hashicorp/tap/terraform 0.15.3 -> 1.0.0
==> Upgrading hashicorp/tap/terraform 0.15.3 -> 1.0.0
```
{{% /tab %}}
{{% tab name="Chocolatey on Windows" %}}

[Chocolatey](https://chocolatey.org/) is a free and open-source package
management system for Windows. Install the [Terraform
package](https://chocolatey.org/packages/terraform) from the command-line.

```shell-session
$ choco install terraform
```

{{% notice note %}}
Chocolatey and the Terraform package are **NOT** directly maintained
by HashiCorp. The latest version of Terraform is always available by manual
installation.
{{% /notice %}}

{{% /tab %}}
{{% tab name="Linux" groupId="ux" %}}

HashiCorp officially maintains and signs packages for the following Linux distributions.

{{%expand "Ubuntu/Debian" %}}
Ensure that your system is up to date, and you have the gnupg,
software-properties-common, and curl packages installed. You will use these packages to
verify HashiCorp's GPG signature, and install HashiCorp's Debian package
repository.

```shell-session
$ sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
```

Add the HashiCorp [GPG key][gpg-key].

```shell-session
$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

Add the official HashiCorp Linux repository.

```shell-session
$ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

Update to add the repository, and install the Terraform CLI.

```shell-session
$ sudo apt-get update && sudo apt-get install terraform
```
{{% /expand%}}

{{%expand "CentOS/RHEL" %}}
Install `yum-config-manager` to manage your repositories.

```shell-session
$ sudo yum install -y yum-utils
```

Use `yum-config-manager` to add the official HashiCorp Linux repository.

```shell-session
$ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
```

Install.

```shell-session
$ sudo yum -y install terraform
```
{{% /expand%}}

{{%expand "Fedora" %}}
Install `dnf config-manager` to manage your repositories.

```shell-session
$ sudo dnf install -y dnf-plugins-core
```

Use `dnf config-manager` to add the official HashiCorp Linux repository.

```shell-session
$ sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
```

Install.

```shell-session
$ sudo dnf -y install terraform
```
{{% /expand%}}

{{%expand "Amazon Linux" %}}
Install `yum-config-manager` to manage your repositories.

```shell-session
$ sudo yum install -y yum-utils
```

Use `yum-config-manager` to add the official HashiCorp Linux repository.

```shell-session
$ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
```

Install.

```shell-session
$ sudo yum -y install terraform
```
{{% /expand%}}

{{% /tab %}}
{{< /tabs >}}

## Verify the installation

Verify that the installation worked by opening a new terminal session and listing Terraform's available subcommands.

```shell-session
$ terraform -help
Usage: terraform [-version] [-help] <command> [args]

The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.
##...
```

Add any subcommand to `terraform -help` to learn more about what it does and available options.

```shell-session
$ terraform -help plan
```

### Troubleshoot

If you get an error that `terraform` could not be found, your `PATH` environment
variable was not set up properly. Please go back and ensure that your `PATH`
variable contains the directory where Terraform was installed.

### Enable tab completion

If you use either Bash or Zsh, you can enable tab completion for Terraform
commands. To enable autocomplete, first ensure that a config file exists for
your chosen shell.

{{< tabs >}}
{{% tab name="Bash" groupId="ux" %}}
```shell-session
$ touch ~/.bashrc
```
{{% /tab %}}
{{% tab name="ZSH" groupId="ux" %}}
```shell-session
$ touch ~/.zshrc
```
{{% /tab %}}
{{< /tabs >}}

Then install the autocomplete package.

```shell-session
$ terraform -install-autocomplete
```

Once the autocomplete support is installed, you will need to restart your shell.

## Next Steps

Next, you will create a Terraform Cloud account, and configure Terraform Cloud for your AWS deployments.
