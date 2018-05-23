# Amazon Web Service (AWS) Batch

The Amazon Web Service (AWS) is a "cloud" computing provider which sells access to computational resources on a minute-by-minute basis. The "cloud" is actually just a simple idea that you can buy *access* to computers, instead of buying the computers themselves. Anytime you have a bunch of computers sitting in a warehouse running code for a bunch of different users around the world, that's the "cloud."


Among the different products offered by AWS, the
three most relevant to bioinformatics are:
- [Amazon Elastic Compute Cloud](https://aws.amazon.com/ec2/), or *EC2*: a service that provides access to cloud-based computers of various sizes that allow temporary use by researchers to run computing jobs that require larger processors (CPU's) or more memory than is typically available on a land-based computer.  The computing resources available for a task depend on the choices made about the CPU's or memory allocation in the specific EC2 instance (a virtual computing environment).  
- [Amazon Simple Storage Service](https://aws.amazon.com/s3/), or *S3*:
a service that provides cloud-based data storage in the form of "buckets", or a pool of data that can be accessed anywhere, anytime via the web by users with credentials allowing the access to that specific bucket. The size and particular security and credentials associated with individual S3 buckets are particularly well suited to scaling and flexibility with respect to access.
- [*AWS Batch*](https://aws.amazon.com/batch/): a service which wraps around AWS EC2 resources such that researchers can more easily do computing processes with EC2 instances on data stored in S3.  

### Essential terms

  * Docker image: lightweight operating system / virtual machine [see Docker documentation](link)
  * CPU: Central processing unit, basically just a unit of computation. Your laptop probably has 4 CPUs, while large servers have dozens.

### How it works

The basic idea behind AWS Batch is that it allows you to run a job,
which consists of (1) a command, inside of a (2) Docker image on a machine,
with a (3) specified amount of compute resources. For example, a
trivial job that you could run would be:

  * 1. A command to print some text ("echo Hello World"), on
  * 2. A Docker image that's able to run the command (`ubuntu:16.04`), with
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
