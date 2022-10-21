#!/bin/bash

set -e
set -x

# Now - there seems to be a rancher-specific problem
# with search. Sometimes search does not work, and it
# seems to have to do with nginx (or docker?) assigning
# an IP to the container name `elasticsearch` which
# can't be reached - we get "no route to host".
# A workaround is to send a SIGHUP to the nginx
# process. Found this here, a solution to a different
# problem: https://github.com/docker/compose/issues/2003#issuecomment-138994299

# So first check to see if search is working:

if [[ $(curl -siX GET https://sciwiki.fredhutch.org/sciwiki0/_search/|head -1)  == *"201 OK"* ]]; then
    echo "Search is working, we are good."
    exit 0
fi

echo "Search is not working, need to send SIGHUP to nginx."
# Get the nginx container ID:
NGINX_CONTAINER=$(rancher-v0.6.2/rancher --url https://ponderosa.fhcrc.org --access-key $RANCHERAPI_KEY --secret-key $RANCHERAPI_SECRET ps|grep wiki:latest|cut -d ' ' -f 1)
rancher-v0.6.2/rancher --url https://ponderosa.fhcrc.org --access-key $RANCHERAPI_KEY --secret-key $RANCHERAPI_SECRET exec $NGINX_CONTAINER /bin/kill -SIGHUP 1
echo "SIGHUP sent, hopefully search is working now."

sleep 5

if [[ $(curl -siX GET https://sciwiki.fredhutch.org/sciwiki0/_search/|head -1)  == *"201 OK"* ]]; then
    echo "After SIGHUP, search is working, we are good."
    exit 0
fi


echo "Search is still not working after SIGHUP."
exit 1
