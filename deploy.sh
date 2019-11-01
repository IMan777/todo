#!/usr/bin/env sh

# abort on errors
set -e

# build

npm run build

#navigate into the build directory

cd dist

# deploying

git init
git add -A
git commit -m 'deploy'


#if you are deploying to 
git push -f git@github.com:IMan777/todo-list.git master:gh-pages

cd - 