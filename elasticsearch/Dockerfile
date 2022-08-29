FROM ubuntu:22.04

RUN apt-get update -y && apt-get install -y python3 python3-pip pandoc curl

# not 6.8.2
RUN pip3 install elasticsearch==8.4.0 sh ipython beautifulsoup4 requests

COPY indexer.py /

WORKDIR /

CMD ["python3", "indexer.py"]



