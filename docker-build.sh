#!/bin/bash

echo The site will be built and then will be available at
echo
echo http://0.0.0.0:7979
echo
echo This is your last chance to see that URL.
echo So copy it now. 
echo "When done, type 'docker rm -f wiki-build' in a separate terminal window."
echo
echo Press Enter to continue the build or control-C to quit.

read

if [ $(git branch --show-current) == "main" ]; then
    export JEKYLL_ENV=production
else
    export JEKYLL_ENV=development
fi


docker run -e JEKYLL_ENV=$JEKYLL_ENV --platform linux/amd64 --name wiki-build --rm -v $(pwd):/work -w /work -p 7979:7979 ruby:3.0.1 ./build.sh
