# build me as fredhutch/wiki

FROM ruby:3.0.1

# FROM ubuntu:18.04



# RUN apt-get update -y && apt-get install -y python-dev \
#     build-essential curl libyaml-dev  \
#     zlib1g-dev openssl libssl-dev python-pip libxml2-dev libxslt1-dev
#    # software-properties-common

# RUN apt-add-repository -y ppa:rael-gc/rvm && apt-get update -y && \
#   apt-get install -y rvm

# RUN curl https://bootstrap.pypa.io/get-pip.py | python


# RUN pip install lxml 'pybtex==0.21'


# RUN curl -LO https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.gz && \
#     tar zxf ruby-1.9.3-p551.tar.gz && cd ruby-1.9.3-p551 && \
#     ./configure && make && make install 

# RUN curl -LO https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.3.tar.gz && \
    # tar zxf ruby-2.6.3.tar.gz && cd ruby-2.6.3 && \
    # ./configure && make && make install 



ARG JEKYLL_ENV

ADD ./ /srv/jekyll
WORKDIR /srv/jekyll/

RUN gem install bundler
RUN bundle update
RUN gem install -g Gemfile
RUN bundle install
RUN bundle exec jekyll build

FROM nginx

RUN apt-get update -y && apt-get install -y procps

COPY --from=0 /srv/jekyll/_site/ /usr/share/nginx/html
RUN cp /usr/share/nginx/html/images/favicon.ico /usr/share/nginx/html/
COPY ./info.txt /usr/share/nginx/html/
RUN true # see https://stackoverflow.com/a/62409523/470769
COPY  ./default.conf /etc/nginx/conf.d/default.conf
COPY ./wiki-only.conf /
COPY test.sh /
EXPOSE 80
