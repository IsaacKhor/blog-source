#!/bin/bash

echo -e "Deploying updates to GitHub..."

# Build the project.
echo -e "Building site... \n"
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="Rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
echo -e "\nDeploying site...\n"
git push origin master

# Come Back
cd ..

# Add and commit changes (in source repo)
git add -A
git commit -m "$msg" # msg already set from the public repo

echo -e "\nPushing blog source...\n"
git push
