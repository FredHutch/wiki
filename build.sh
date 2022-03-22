#!/bin/bash

# This script is meant to be called 
# from docker-build.sh.

# It might work if called directly, assuming
# you have ruby and bundler installed.

# When done, you can browse to
# http://0.0.0.0:7979

# to see the built site.

bundle update
gem install -g Gemfile
bundle install
bundle exec jekyll serve -H 0.0.0.0 -P 7979
