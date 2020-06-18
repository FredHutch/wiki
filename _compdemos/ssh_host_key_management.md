---
title: SSH Host Key Management
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

This page will describe SSH host keys, how they're used, and how to manage those keys for different SSH clients.  However, for now this page only describes removing bad keys, with the rest of that information to come.

## Removing Old Keys

When a host is reinstalled often times the SSH host key will also be changed.  This will raise an error indicating that the host's key does not match what your client has in its database.  "DNS spoofing" and "host identification changed" are common messages.

In most cases- as our DNS is very well run- it is sufficient to remove the old key and replace it with the updated key.  There are additional ways to validate that the host is genuine which will be described later in this section.

### Removing from OSX and Linux Command Line Client

The command line client for OSX and Linux behave in pretty much the same way.  The host key database is kept in a file in your home directory, in the file `~/.ssh/known_hosts`.  Modern versions of SSH encode this information in a way not readily apparent to humans so using the SSH tools to remove and update the key is the best way to accomplish this (versus the old way of just editing the file with a text file).

```
ssh-keygen -R <hostname>
ssh-keygen -R <hostname>.fhcrc.org
```

### Key Conflict with PuTTY

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
