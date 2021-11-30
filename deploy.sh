#!/bin/bash

# Abort if anything returns a non-zero exit code
set -e

echo -e "Deploying updates to GitHub..."

# Build the project.
echo -e "Building site... \n"
hugo --quiet # if using a theme, replace by `hugo -t <yourtheme>`

# Add and commit changes (in source repo)
git add -A
git commit -m "$1" # msg already set from the public repo

echo -e "\nPushing blog source...\n"
git push
