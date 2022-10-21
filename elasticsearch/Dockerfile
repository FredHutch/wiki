
FROM elasticsearch:8.4.2

USER root

RUN apt-get update -y && apt-get install -y python3 python3-pip pandoc curl

# not 6.8.2 8.4.0
RUN pip3 install elasticsearch==8.4.0 sh ipython beautifulsoup4 requests

WORKDIR /

COPY indexer.sh /
COPY indexer.py /

RUN chmod a+rx /indexer.*

COPY  tmp/ /html/
RUN chown -R elasticsearch /html

USER elasticsearch


ENV discovery.type=single-node
ENV xpack.security.enabled=false
ENV ingest.geoip.downloader.enabled=false
ENV ES_JAVA_OPTS="-Xms20g -Xmx20g"

