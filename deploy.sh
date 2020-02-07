#!/bin/bash
set -xe

if [ $TRAVIS_BRANCH == 'master' ] ; then
  echo "Deploying to production."
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa

echo $(pwd)
  cd /var/www/andrewadcock/
  git init

  git remote add deploy "root@165.227.179.245:/var/www/andrewadcock"
  git config user.name "Andrew Adcock"
  git config user.email "andrewadcock+travis@gmail.com"

  git add .
  git commit -m "Deploy"
  git push --force deploy master
else
  echo "Not deploying, since this branch isn't master."
fi