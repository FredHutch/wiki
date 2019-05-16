#!/usr/bin/env python3

"convert html to documents that can be ingested into cloudsearch"
import json

from contextlib import contextmanager
from io import StringIO
import os

import lxml.html
import sh


@contextmanager
def cd(newdir):
    prevdir = os.getcwd()
    os.chdir(os.path.expanduser(newdir))
    try:
        yield
    finally:
        os.chdir(prevdir)


def main():
    "do the work"
    outdir = os.getcwd() # TODO parameterize
    outfile = os.path.join(outdir, "output.json")
    outlist = []
    with cd("_site"):  # TODO unhardcode
        for root, dirs, files in os.walk(".", topdown=False):
            for name in files:
                if name.endswith(".html"):
                    filename = os.path.join(root, name)
                    url = filename.lstrip(".")
                    print(url)
                    doc = lxml.html.parse(filename)
                    title = doc.find(".//title").text.replace(" - Fred Hutch Biomedical Data Science Wiki", "")
                    # print(title)
                    outio = StringIO()
                    sh.pandoc("-f", "html", "-t", "plain", filename, _out=outio)
                    # print(outio.getvalue())
                    outdict=dict(type="add",
                                 id=url,
                                 fields=dict(title=title, content=outio.getvalue()))
                    outlist.append(outdict)
                    # with open(outfile, "w") as outfh:
                    #     json.dump(outdict, outfh)


        # for name in dirs:
        # print(os.path.join(root, name))

    with open(outfile, "w") as outfh:
        json.dump(outlist, outfh)

if __name__ == "__main__":
    main()
