---
title: SSH Host Key Management
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

[SSH keys](https://www.ssh.com/ssh/key/) are used to manage access credentials to computing resources. 
They are similar to names and passwords, 
and confirm that the identity of individuals attempting to log on to or use a machine. 
The first time you log on to `rhino`, 
you'll be asked if you want to add a key to your list of known hosts.
Every time you log on after that,
that key will be compared to the key provided by the host (compute resource). 
If the keys match,
everything proceeds as expected.
If the keys don't match, 
you'll receive information describing what the problem might be.

This page will describe SSH host keys, how they're used, and how to manage those keys for different SSH clients.  However, for now this page only describes removing bad keys, with the rest of that information to come.

## Removing Old Keys

When a host is reinstalled often times the SSH host key will also be changed.  This will raise an error indicating that the host's key does not match what your client has in its database.  "DNS spoofing" and "host identification changed" are common messages.

In most cases- as our DNS is very well run- it is sufficient to remove the old key and replace it with the updated key.  There are additional ways to validate that the host is genuine which will be described later in this section.

### Removing from OSX and Linux Command Line Client

If you are logging on to a compute resource using OSX or Linux,
you are probably using the command line (e.g., Terminal).
The host key database is kept in a file in your home directory, in the file `~/.ssh/known_hosts`.  Modern versions of SSH encode this information in a way not readily usable by humans so using the SSH tools to remove and update the key is the best way to accomplish this (versus the old way of just editing the file with a text file).

```
ssh-keygen -R <hostname>
ssh-keygen -R <hostname>.fhcrc.org
```

For example, to remove the key for `rhino`, you would run:

```
ssh-keygen -R rhino.fhcrc.org
```

When you next attempt to log in to `rhino`, 
you'll be asked to add the correct key to known hosts.

### Key Conflict with PuTTY

If you are logging on to a compute resource on a Windows machine using PuTTY,
you'll need to use a different strategy since 
PuTTY does not have similar key management tools.  However, it will prompt you to replace the key:

```
The server's host key is not cached in the registry. You
have no guarantee that the server is the computer you
think it is.
The server's rsa2 key fingerprint is:
ssh-rsa 1024 7b:e5:6f:a7:f4:f9:81:62:5c:e3:1f:bf:8b:57:6c:5a
If you trust this host, hit Yes to add the key to
PuTTY's cache and carry on connecting.
If you want to carry on connecting just once, without
adding the key to the cache, hit No.
If you do not trust this host, hit Cancel to abandon the
connection.
```

Clicking the "Yes" button will replace the key.

## Validating Hosts

If you would like to take the extra step to ensure that the host you are connecting is, indeed, the correct host and not a spoofed DNS entry, contact SciComp and provide the key fingerprint of the host (including key type, e.g. rsa2, ecdsa).
