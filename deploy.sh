#!/bin/bash
set -xe

if [ $TRAVIS_BRANCH == 'master' ] ; then
  echo "Deploying to production."
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa

  echo "Clears git information"
  rm -rf .git

echo $(pwd)
  #cd /var/repo/andrewadcock
  git init

  git remote add deploy "root@165.227.179.245:/var/repo/andrewadcock.git"
  git config user.name "Andrew Adcock"
  git config user.email "andrewadcock+travis@gmail.com"

  git add .
  git status # debug
  git commit -m "Deploy"
  git push --force deploy HEAD:master
else
  echo "Not deploying, since this branch isn't master."
fi