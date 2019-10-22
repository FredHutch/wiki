---
title: Computing Resource Credentials
last_modified_at: 2019-04-03
primary_reviewers: dtenenbaum, atombaby
---

This section describes how to get access and credentials to computing systems on campus and in the cloud.

## HutchNet ID

A HutchNet ID is the standard login name and password you receive when you start working at the Hutch or are an official affiliate. It is also called Network login or Active Directory credentials. You can use it to login to most resources at the Center (Desktop Computer, Employee Self Service, VPN, Webmail) as well to Scientific Computing systems such as `Rhino` (`ssh rhino`), which is the login system to large scale cluster computing resources like `Gizmo`, `Beagle` and `Koshu`.

If one of your collaborators requires access to the Fred Hutch network you can submit a [non-employee action form](https://centernet.fredhutch.org/cn/f/hr/lcex/non-employee-action-form.html). Non-employees is a generic administrative term for affiliates, students, contractors, etc.

Please see the Service Desk site on CenterNet for more information about [HutchNet ID](https://centernet.fredhutch.org/cn/u/center-it/help-desk.html) including password rotation, etc.

## GitHub.com

The [Fred Hutch GitHub organization](https://github.com/FredHutch) offers free access to public and private git repositories to all Fred Hutch staff and collaborators. If you are a Fred Hutch employee working with source code and don't have a github.com account yet, please [create one](https://github.com/join) and email `scicomp`: "Please add my GitHub user id `xyz` to organization github.com/FredHutch". Once you are a member of the organization you can create repositories, teams and invite external collaborators to share and edit code.

>Note: www.github.com/FredHutch is the only officially approved cloud based source code system at Fred Hutch. It has security features that are otherwise not available via other systems.

A GitHub account is different from other accounts. If you leave the Hutch you keep your GitHub account, however you will just be removed from the Fred Hutch organization on GitHub and your former colleagues can still add you as an external collaborator to their GitHub repositories.

We have a Code Management primer that provides more information about [git and GitHub](/scicomputing/software_managecode/) in general and specifically here at the Fred Hutch.  

### Guidance for Managing Credentials and Passwords
One issue to note when using GitHub to do version control in your code is that it can be very straightforward to inadvertently push content to GitHub that includes things such as API tokens, usernames and passwords, or even your AWS credentials themselves.  Please take care to structure your code in such a way that these "secrets" or anything you perceive to be private information (see our [Security page](/generation/human_privacySecurity/) for more information about what this might be) are loaded from an external file or environment variables that themselves are not sent to GitHub!!

## Amazon Web Services (AWS)

You can obtain [Amazon Web Services](https://aws.amazon.com/) (AWS) credentials to make use of the Center's AWS account. By default this will give you access to your lab's S3 bucket, but you can request permission (by emailing `scicomp@`) to use other services such as _AWS Batch_.  AWS credentials are designated per user, so any Fred Hutch employee should obtain their own credentials.

>Note: Beyond precautions taken to protect any other credentials listed here, take care to ensure AWS credentials are never shared with or disclosed to any other user, directly (e.g., by email) or indirectly (e.g., by including them in code and sharing the code/committing to GitHub).  If you need credentials for an external collaborator, or if you are having a permissions issue, please email `scicomp` to request support from [Scientific Computing](https://centernet.fredhutch.org/cn/u/center-it/cio/scicomp.html).

There are two ways to get AWS credentials. Which one to use depends on how you will use AWS, either via the command line on `rhino`/`gizmo` or via graphical programs on your local computer such as via Cyberduck or Mountain Duck.


### Command Line (Rhino/Gizmo) Instructions

A working HutchNet ID is all you need to login to `rhino`. We provide basic references for bash/linux computing [here](/scicomputing/prog_linux101/), as well as a resource library page for [advanced ssh configurations](/scicomputing/access_methods/) at Fred Hutch.  These resources will provide the necessary information for how to connect to `rhino`/`gizmo` resources to be able to run these instructions.  If you have questions about how to access `rhino` to perform these steps please email `scicomp`.  

First, `ssh` to one of the `rhino` machines (or use NoMachine):

```
ssh hutchid@rhino
```

Some users will see an error message that their home directory was not found. This can happen if you are in a newly created department or in one that is typically not working with SciComp resources. Please email `scicomp` to have your home directory created.


Then run the `awscreds` command.

```
awscreds
```

This will prompt you for your HutchNet password, which will not echo to the screen when you type it in.  It will then write out your credentials to files, which programs that use AWS will look for. `awscreds` will report exactly what it's doing and where it has written your credentials. `awscreds` includes some options that allow you to customize its behavior. You can see this options by typing the command

```
awscreds --help
```

One important option is the `--force` flag, which tells `awscreds` that it can overwrite
your existing credentials. This may be needed
if your credentials are changed, and can be invoked as follows:

```
awscreds --force
```

### Testing Your Credentials

To test your credentials to ensure that you have the correct permissions to your PI bucket, execute the following to copy a file from our shared reference data bucket to your local system, and then copy that file to your PI bucket.  

```
module load awscli
aws s3 cp s3://fh-ctr-public-reference-data/wiki_example_data/iris.csv .
```

In the commands below, replace `lastname-f` (where `f` is the PI's first name initial) with the name associated to your PI bucket:

```
aws s3 cp iris.csv s3://fh-pi-lastname-f/iris.csv
```
If you notice any errors with this, please email the commands you executed and the output to `scicomp` for assistance with your AWS S3 credentials. 

Once you have confirmed your credentials, remember to remove the test file:

```
aws s3 rm s3://fh-pi-lastname-f/iris.csv
```

See more about accessing AWS S3 via the command line [here](/compdemos/aws/).


### GUI Instructions

Open a web browser and navigate to [the Toolbox](https://toolbox.fhcrc.org/sw2srv/aws/account).
This page is only accessible within the Hutch network. When prompted, enter your HutchNet ID and password. Your browser will display your access key and secret key. You can use these with graphical applications such Cyberduck,  Mountain Duck, or [Motuz](/compdemos/motuz/). See the more about how to use Cyberduck or Mountain Duck to connect to AWS S3 [here.](/compdemos/Mountain-CyberDuck/)
