#!/bin/bash

cp /wiki-only.conf /etc/nginx/conf.d/default.conf


nginx -g "daemon off;"

