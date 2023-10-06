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
# from elasticsearch import Elasticsearch, RequestsHttpConnection, ElasticsearchException
# new:
from elasticsearch import Elasticsearch, ApiError

def clean_cruft(filepath):
    """
    Remove left and right navigation elements from the page 
    before we index it so we don't end up with a bunch of
    navigation links in our search results.
    """
    with open(filepath) as fhnd:
        soup = BeautifulSoup(fhnd, "html.parser")
    nav_tags = soup.find_all('nav', class_=['toc', 'nav__list'])
    for nav_tag in nav_tags:
        nav_tag.decompose()
    with open(filepath, "w") as fhnd:
        fhnd.write(soup.prettify())



def crawl_documents():
    docs = []
    for root, dirs, files in os.walk('/html/html'):
        for file in files:
            if file.endswith("index.html"):
                fullpath = os.path.join(root, file)
                clean_cruft(fullpath)
                url = fullpath.replace('/html/html', '')
                url = url.replace("index.html", "")
                print(f"Processing {url} ...")
                text = sh.pandoc("-f", "html", "-t", "plain", fullpath)
                with open(fullpath) as f:
                    soup = BeautifulSoup(f, "html.parser")
                title = soup.title.string
                title = title.replace(" - Fred Hutch Biomedical Data Science Wiki", "").strip()
                doc = dict(url=url, content=str(text), title=title)
                docs.append(doc)
    return docs


def wrap(docs):
    outer = []
    for doc in docs:
        doc_id = doc['url']
        del doc['url']
        # old version requires type, new version doesn't want it.
        # doc['_type'] = 'document' # old
        item = dict(_index=INDEX_NAME, _id=doc_id, _source=doc)
        outer.append(item)
    return outer

def bulk_up(docs):
    client = Elasticsearch("http://localhost:9200",
      headers={'Content-Type': 'application/json'})
    print("Preparing for bulk import....")
    try:
        retval = bulk(client, str(docs))
        print("Bulk import was successful.")
        print(retval)
        return retval
    # new:
    except ApiError as e:
    # old:
    # except ElasticsearchException as e:
        print("Bulk import failed.")
        print(e)
        sys.exit(1)

def main():
    docs = wrap(crawl_documents())
    bulk_up(docs)

if __name__ == '__main__':
    main()
