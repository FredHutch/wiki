#!/bin/bash

set -x
set -e

curl -X PUT "http://localhost:9200/sciwiki0/" -H 'Content-Type: application/json'
echo
# TODO REMOVE THIS
curl http://localhost:9200
python3 indexer.py
# curl --connect-timeout 3600  -X POST "http://elasticsearch:9200/sciwiki0/_flush" -H 'Content-Type: application/json'
sleep 20

