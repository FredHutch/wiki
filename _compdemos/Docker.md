---
title: Docker
last_modified_at: 2018-11-29
main_author: Dirk Petersen
primary_reviewers: dtenenba, dirkpetersen
---
## Create a Docker image
You may not need to create your own Docker image, but that depends on what you want to do. If you are using software that is
readily available, there is probably already a Docker image containing
that software. Look around on [Docker Hub](https://hub.docker.com/) to see
if there's already a Docker image available.

The SciComp group is also developing Docker images that contain much
of the software you are used to finding in `/app` on the `rhino`
machines and `gizmo`/`beagle` clusters (here's the [R image](https://hub.docker.com/r/fredhutch/ls2_r/)).

If you've found an existing Docker image that meets your needs, you don't
need to read the rest of this section.

### Docker Installation Instructions
It's recommended (but not required) that you install
[Docker](https://www.docker.com/) on your workstation (laptop or desktop)
and develop your image on your own machine until it's ready to be deployed.

* [Windows](https://www.docker.com/docker-windows)
* [Mac](https://www.docker.com/docker-mac)
* [Ubuntu Linux](https://www.docker.com/docker-ubuntu)


## Deploy a Docker Image
More to come.
### [Create GitHub Account](/bioinformatics/compute_github/)
See our docs at the above link.
### Create a Docker Hub Account
More to come.
### Push your Dockerfile to a GitHub repository
More to come.
### Create an Automated Build in Docker Hub
More to come.
## Create a Job Definition



## Run Your Own Docker Host

You can now deploy your own docker host on the proxmox virtual test environment. This environment uses 5 large memory machines (16 cores, 384GB memory each) from the previous rhino class

Login to Rhino via ssh and follow these quick step to run your own docker host:

pick a new host name (in this case we pick 'sausage') and
make sure it does not already exist, ping should respond "unknown host"
```
petersen@rhino3:~$ ping sausage
ping: unknown host sausage
```
​now bootstrap a new machine container 'sausage' with 1024 MB memory and
8GB diskspace using the "prox new" command and your Hutch net password.

```
petersen@rhino3:~$ prox new --mem 1G --disk 8 --no-bootstrap sausage
Password for 'petersen':

installing on node "proxa3"
creating host sausage with ID 121 in pool SciComp
    ...UPID:proxa3:00001F6C:00F2DBDE:57EE629A:vzcreate:121:petersen@FHCRC.ORG:
​Starting host 121 ..
    ...UPID:proxa3:00001FB3:00F2E185:57EE62A8:vzstart:121:petersen@FHCRC.ORG:
Machine 121 : running, cpu: 0%

waiting for machine sausage to come up .. hit ctrl+c to stop ping
PING sausage.fhcrc.org (140.107.117.249) 56(84) bytes of data.
64 bytes from sausage.fhcrc.org (140.107.117.249): icmp_seq=1 ttl=63 time=3.17 ms
```
Note: you can leave out the `--mem` and `--disk` options if you want the defaults: 512MB mem & 4GB disk

The prox command checks that the machine is up, now you can login as root with the prox ssh command or by using your Hutch net password​:​
```
petersen@rhino3:~$ prox ssh root@sausage
Welcome to Ubuntu 16.04.1 LTS (GNU/Linux 4.4.19-1-pve x86_64)
```
Now install the latest Docker Engine CE:​

```
sudo apt-get install curl apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce
```
and verify that docker works as expected by running the hello world container:
```
root@sausage:~# docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
c04b14da8d14: Pull complete
Digest: sha256:0256e8a36e2070f7bf2d0b0763dbabdd67798512411de4cdcf9431a1feb60fd9
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.​
```
Now let's assume you would like to install multiple machines to build a small cluster. Each machine
requires some ad hoc configuration. We can create a runlist in a simple text file and each command in
that list will be executed on each machine. In this case we made a runlist that installs docker:
```
petersen@rhino3:~$ cat ~/runlists/docker.runlist
sudo apt-get install curl apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce
```
​now we can use the `prox` command to install multiple machines:

*WARNING*: Each machine requires an IP address and there are a limited number of IP addresses in
the subnet of the proxmox cluster. Try not to deploy not more than 10 machines at a time.
```
petersen@rhino3:~$ prox new --runlist ~/runlists/docker.runlist --disk 8 --no-bootstrap  sausage1 sausage2 sausage3          
Password for 'petersen':

creating host sausage1 with ID 116 in pool SciComp
    ...UPID:proxa3:000039A6:0111B96E:57EEB19E:vzcreate:116:petersen@FHCRC.ORG:
creating host sausage2 with ID 118 in pool SciComp
    ...UPID:proxa3:000039B6:0111B980:57EEB19E:vzcreate:118:petersen@FHCRC.ORG:
creating host sausage3 with ID 121 in pool SciComp
    ...UPID:proxa3:000039C4:0111B991:57EEB19E:vzcreate:121:petersen@FHCRC.ORG:
Starting host 116 ..
starting host 116, re-try 0
    ...UPID:proxa3:00003A04:0111BCB7:57EEB1A6:vzstart:116:petersen@FHCRC.ORG:
Machine 116 : running, cpu: 0%
Starting host 118 ..
    ...UPID:proxa3:00003AF7:0111BD3C:57EEB1A8:vzstart:118:petersen@FHCRC.ORG:
Machine 118 : running, cpu: 0%
Starting host 121 ..
    ...UPID:proxa3:00003BE2:0111BDC2:57EEB1A9:vzstart:121:petersen@FHCRC.ORG:
Machine 121 : running, cpu: -1% ​
```
and after you are done with your work you can stop and then destroy these machines:
```
petersen@rhino3:~$ prox stop sausage1 sausage2 sausage3
Password for 'petersen':

UPID:proxa2:000060FE:01121EA2:57EEB2A1:vzstop:116:petersen@FHCRC.ORG:
UPID:proxa3:00006110:01121EB3:57EEB2A1:vzstop:118:petersen@FHCRC.ORG:
UPID:proxa4:00006127:01121EC6:57EEB2A1:vzstop:121:petersen@FHCRC.ORG:

petersen@rhino3:~$
petersen@rhino3:~$ prox destroy sausage1 sausage2 sausage3
Password for 'petersen':

UPID:proxa2:000061C7:01122C18:57EEB2C4:vzdestroy:116:petersen@FHCRC.ORG:
UPID:proxa3:000061CB:01122C2A:57EEB2C4:vzdestroy:118:petersen@FHCRC.ORG:
UPID:proxa4:000061CF:01122C3B:57EEB2C4:vzdestroy:121:petersen@FHCRC.ORG:​​
```
*IMPORTANT*: If you stop a machine with the `prox stop` command the host name will not be purged from DHCP/DNS. If you want to re-use that hostname you need to wait for a couple of days. However, if you login to a machine and shut it down with the  'shutdown -h now' command the hostname will be released immediately and you can re-use right away after destroying the machine.
