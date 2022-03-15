---
title: using Docker at Fred Hutch
last_modified_at: 2018-12-17
main_author: Dirk Petersen
primary_reviewers: dtenenba, dirkpetersen
---

## Accessing Docker
You can either install docker on your own machine or you install on the SciComp test server farm 

### On Your Local Computer

It's recommended (but not required) that you install
[Docker](https://www.docker.com/) on your workstation
and develop your image on your own machine until it's ready to be deployed.

* [Windows](https://www.docker.com/docker-windows)
* [Mac](https://www.docker.com/docker-mac)
* [Ubuntu Linux](https://www.docker.com/docker-ubuntu)


### On the SciComp Test Environment

You can deploy your own docker machine on the Proxmox virtual test environment in ca 60 sec using the `prox` command. 
This environment uses multiple large memory machines (16 cores, 384GB memory each) which are re-purposed previous generation Rhino class machines.

Login to Rhino via {% glossary ssh %} and follow these quick steps to run your own docker host.  Pick a new host name (in this case we pick `sausage`) and  make sure it does not already exist, ping should respond "unknown host"

```
    petersen@rhino:~$ ping sausage
    ping: unknown host sausage
```

Now bootstrap a new machine `sausage` using the "prox new" command  with the --docker option and your HutchNet password.

```
    petersen@rhino3:~$ prox new --docker --no-bootstrap sausage
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

The prox command checks that the machine is up, now you can login as root with the prox ssh command or by using your Hutch net password.

```   
    petersen@rhino:~$ prox ssh root@sausage
    Welcome to Ubuntu 16.04.1 LTS (GNU/Linux 4.4.19-1-pve x86_64)
```

First, change the network configuration and restart Docker. You only need to do this once, but if you don't
do it you will have network problems:

```
echo '{ "bip": "10.99.99.1/24" }'  > /etc/docker/daemon.json
service docker restart
```

Verify that docker works as expected by running the hello world container.

 ```   
    root@sausage:~# docker run hello-world
    Unable to find image 'hello-world:latest' locally
    latest: Pulling from library/hello-world
    c04b14da8d14: Pull complete 
    Digest: sha256:0256e8a36e2070f7bf2d0b0763dbabdd67798512411de4cdcf9431a1feb60fd9
    Status: Downloaded newer image for hello-world:latest

    Hello from Docker!
    This message shows that your installation appears to be working correctly.
```    

Now let's assume you would like to install multiple machines to build a small cluster. Each machine requires some ad hoc configuration and we want a little more disk and memory. warning: Each machine requires its own IP address and there are a limited number of IP addresses in the subnet of the development cluster. Try not to deploy more than 10 machines at a time.

```
    petersen@rhino3:~$ prox new --docker --mem 1G --disk 8 --no-bootstrap  sausage1 sausage2 sausage3
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
    Machine 121 : running, cpu: -1% 
```

After you are done with your work you can stop and then destroy these machines.

```
    petersen@rhino3:~$ prox stop sausage1 sausage2 sausage3
    Password for 'petersen':

    UPID:proxa2:000060FE:01121EA2:57EEB2A1:vzstop:116:petersen@FHCRC.ORG:
    UPID:proxa3:00006110:01121EB3:57EEB2A1:vzstop:118:petersen@FHCRC.ORG:
    UPID:proxa4:00006127:01121EC6:57EEB2A1:vzstop:121:petersen@FHCRC.ORG:

    petersen@rhino:~$ prox destroy sausage1 sausage2 sausage3
    Password for 'petersen':

    UPID:proxa2:000061C7:01122C18:57EEB2C4:vzdestroy:116:petersen@FHCRC.ORG:
    UPID:proxa3:000061CB:01122C2A:57EEB2C4:vzdestroy:118:petersen@FHCRC.ORG:
    UPID:proxa4:000061CF:01122C3B:57EEB2C4:vzdestroy:121:petersen@FHCRC.ORG:​​
```

>**Important:** If you stop a machine with the 'prox stop' command the host name will not be purged from DHCP/DNS. If you want to re-use that hostname you need to wait for a couple of days. 
However, if you login to a machine and shut it down with  the 'shutdown -h now' command the hostname will be released immediately and you  
can re-use right away after destroying the machine. 
This trick does currently only work with the default machine which is based on Ubuntu 16.04. It does not work (as of December 2018) if you use Ubuntu 18.04, such as:

```
    petersen@rhino3:~$ prox new --docker --ubuntu 18.04 --no-bootstrap sausage
```

## Using pre-made Docker images with application stacks

You may not need to create your own Docker image, but that depends on what you  want to do. If you are using software that is readily available, there is probably already a Docker image containing that software. 
Look around on [Docker Hub](https://hub.docker.com/) to see if there's already a Docker image available.

SciComp is also developing Docker images that contain much of the software you are used to finding in `/app` on the `rhino` machines the and `gizmo` clusters (here's the [R image](https://hub.docker.com/r/fredhutch/ls2_r/)).

If you've found an existing Docker image that meets your needs, you don't
need to read the rest of this section.

## Create your own Docker image and put your software inside

### [Create GitHub Account](/scicomputing/software_managecode/)

You really need a GitHub account to properly build docker containers. Please see our [Shiny](/compdemos/shiny/) app example on how to create your own docker image  

### Deploy your Docker image to production

Your own machine or the SciComp test farm are likely poor choices for running production level
applications in containers. For production deployments you will need a GitHub account. (see above)

#### Using docker hub 

[Dockerhub](https://hub.docker.com/) is a good choice for fully public open source projects 

##### Push your Dockerfile to a GitHub repository
More to come.
##### Create an Automated Build in Docker Hub
More to come.
### Create a Job Definition

### Using the Fred Hutch Container environment

SciComp supports 3 [Rancher](https://rancher.com/) environments for hosting docker 
based web applications:

| Env Name | Purpose  |
|------|------|
|SciComp     |Internal only SciComp managed applications  |
|SciComp-ext |Publicly accessible SciComp managed applications |
|HDC_Local   |HDC application environment (currently hosting HICORIQ)

Please email `SciComp` to request assistance and discuss which environment is best for your needs.





