## Using Amazon S3 from the Command Line


Once you have [obtained S3 credentials](/computing/access_get_aws_credentials/#command-line-instructions), you can use them to transfer files from/to the Center's Economy Cloud file service which is currently implemented using  S3​ buckets. 

### Determine your lab's bucket name

If you work in the lab of the PI Jane Doe, your lab's S3 bucket name will be `fh-pi-doe-j`. Please substitute your lab's actual bucket name when using these examples.

Copy a file to your lab's S3 bucket
​

This command will copy the file `hello.txt` from your current directory to the top-level folder of your lab's S3 bucket:
​
```
aws s3 cp hello.txt ​s3://fh-pi-doe-j/
```

​You can also copy files to folders within your bucket. Folders do not have to be created beforehand. This examples copies the file `hello.txt` to the folder path `a/b/c`:

```
aws s3 cp hello.txt s3://fh-pi-doe-j/a/b/c/
```

Copying files from your lab's S3 bucket to the machine you are logged into
This example copies the file hello.txt from the top level of your lab's S3 bucket, to the current directory on the (`rhino` or `gizmo`) system you are logged into. The current directory is represented by the dot (`.`) character.

```
aws s3 cp s3://fh-pi-doe-j/hello.txt .
```


After running this command, you'll have the file `hello.txt` in your current directory.

This example copies `hello.txt` from the `a/b/c` folder in your bucket to the current directory:


```
aws s3 cp s3://fh-pi-doe-j/a/b/c/hello.txt .
```


#### Listing Bucket Contents


This example will list the contents of your lab's bucket:


```
aws s3 ls s3://fh-pi-doe-j/
```

To list t​he contents of a specific folder, just add the folder path to the end of the previous example:

```
aws s3 ls s3://fh-pi-doe-j/a/b/c/
```

#### ​More S3 Commands

​The complete set of aws s3 commands is documented [here​](https://docs.aws.amazon.com/cli/latest/reference/s3/index.html), and you can also type 

```
aws s3 help
```

for more information. To see documentation for a specific s3 subcommand, such as `cp`, do this:

```
aws s3 help cp
```


#### ​Accessing other AWS Services
​

S3 is the only service you can access immediately after creating your credentials.​

For questions about accessing other services, please contact [Help Desk​](https://centernet.fredhutch.org/cn/u/center-it/help-desk.html).
