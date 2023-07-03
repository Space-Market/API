#!/bin/sh
source .env 2> /dev/null
npm run build
if [ -n $TRAVIS_BRANCH ]; then
  if [ $TRAVIS_BRANCH != "gh-pages" ]; then
    mkdir -p .tmp/preview/${TRAVIS_BRANCH}/
    cp web_deploy/* .tmp/preview/${TRAVIS_BRANCH}/
    npm deploy-to-gh-pages --update .tmp
  fi
fi
