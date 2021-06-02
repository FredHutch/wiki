#!/bin/bash

echo The site will be built and then will be available at
echo
echo http://localhost:7979
echo
echo This is your last chance to see that URL.
echo So copy it now. 
echo "When done, type 'docker rm -f wiki-build' in a separate terminal window."
echo
echo Press Enter to continue the build or control-C to quit.

read

docker run  --name wiki-build --rm -v $(pwd):/work -w /work -p 7979:7979 ruby:2.7.1 ./build.sh
