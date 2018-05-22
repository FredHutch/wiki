# AWS Batch

The Amazon Web Service (AWS) is a "cloud" computing provider which
sells access to computational resources on a minute-by-minute basis.
Among the different products that you can purchase from AWS, the
three most relevant are *EC2*, which provides access to computers; *S3*,
which provides long term data storage; and *Batch*, which wraps around
and makes it easy to use both of those resources.

Full details on AWS Batch can be found in their [documentation](https://aws.amazon.com/batch/).

### How it works

The basic idea behind AWS Batch is that it allows you to run a job,
which consists of (1) a command inside (2) a Docker image on a machine
with (3) a specified amount of compute resources. For example, a 
trivial job that you could run would be:

  * 1. A command to print some text ("echo Hello World"), on
  * 2. A Docker image that's able to run the command (`ubuntu/16:04`), with
  * 3. A specified number of CPUs (e.g. 1) and memory (e.g. 1Gb)

Based on those parameters, Batch will **automatically**:

  * 1. Find a machine with the required number of CPUs and memory
  * 2. Download the Docker image
  * 3. Run the command within the Docker image
  * 4. Shut down the Docker container
  * 5. Shut down the machine if it is no longer needed

Batch will often combine multiple jobs onto a single machine, if that is
the most cost effective approach, with all jobs effectively isolated from
each other within their own Docker image.
The big idea here is that you can save money by only paying for compute
resources at the exact time you need it, without worrying about how to pick
the most cost effective combination of EC2 instances.

### Analyzing and storing data

Coming from Fred Hutch, one of the biggest things to transition is how you
access and store data. While we are very used to the shared filesystem on
`gizmo`, you have none of that available on Batch. Instead, you must download
your data from S3 before analyzing it, and then upload the results back to
S3 when you are done. All data within the Docker image when the command is
complete will be deleted -- we refer to this type of storage as "ephemeral."

It's very easy to download and upload from S3, but it just means that you 
have to get used to keeping your data there in order to use AWS Batch
effectively. As a benefit, it's must cheaper to store data there compared
to `/fh/fast`, and just as stable.


### Using Docker images

In order to run your code, you must have it packaged up in a Docker image.
While this may be slightly difficult at first, it has the added benefit
that your analysis is highly reproducible. You never have to worry that
some dependency may have changed, and which would change the results. It
is also very easy to publish your results and cite the Docker image as the
definitive record of all of the dependencies and software needed to run your
analysis and generate the published results.


### Using AWS Batch at Fred Hutch

AWS Batch has not yet been fully rolled out at Fred Hutch, but it is anticipated
that it will be available in the not-too-distant future [[ these comments
have not been approved by SciComp and are the personal opinion of the author ]].
