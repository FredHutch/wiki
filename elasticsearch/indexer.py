#!/usr/bin/env python3

# library imports

import json
import os
import sys

# third party imports

from bs4 import BeautifulSoup
import requests
import sh

INDEX_NAME="sciwiki0"

from elasticsearch.helpers import bulk
# old:
from elasticsearch import Elasticsearch, RequestsHttpConnection, ElasticsearchException
# new:
# from elasticsearch import Elasticsearch, ApiError

def crawl_documents():
    docs = []
    for root, dirs, files in os.walk('/html/html'):
        for file in files:
            if file.endswith("index.html"):
                fullpath = os.path.join(root, file)
                url = fullpath.replace('/html/html', '')
                url = url.replace("index.html", "")
                print(f"Processing {url} ...")
                ret = sh.pandoc("-f", "html", "-t", "plain", fullpath)
                text = ret.stdout.decode('utf-8')
                with open(fullpath) as f:
                    soup = BeautifulSoup(f, "html.parser")
                title = soup.title.string
                title = title.replace(" - Fred Hutch Biomedical Data Science Wiki", "").strip()
                doc = dict(url=url, content=text, title=title)
                docs.append(doc)
    return docs


def wrap(docs):
    outer = []
    for doc in docs:
        doc_id = doc['url']
        del doc['url']
        # old version requires type, new version doesn't want it.
        doc['type'] = 'document'
        item = dict(_index=INDEX_NAME, _id=doc_id, type='document', _source=doc)
        outer.append(item)
    return outer

def bulk_up(docs):
    client = Elasticsearch("http://elasticsearch:9200",
      headers={'Content-Type': 'application/json'})
    print("Preparing for bulk import....")
    try:
        retval = bulk(client, docs)
        print("Bulk import was successful.")
        print(retval)
        return retval
    # new:
    # except ApiError as e:
    # old:
    except ElasticsearchException as e:
        print("Bulk import failed.")
        print(e)
        sys.exit(1)

def main():
    docs = wrap(crawl_documents())
    bulk_up(docs)

if __name__ == '__main__':
    main()
