#!/bin/bash
#
# for convenience this script will check if an app has already been created
# if not it will use the rails gem installed in the docker image to create 
# the app for you and place it in the mounted app volume
# 
set -e

# Check if the /app directory is empty
if [ -z "$(ls -A /app/app)" ]; then
   echo "The /app directory is empty. Generating a new Rails app..."
   # Navigate to the /app directory
   cd /app/app
   # Generate a new Rails app; adjust the command according to your needs
   rails new . --force --database=postgresql
else
   echo "The /app directory is not empty. Skipping Rails app generation."
fi

cd /app/app
find .
bundle install --jobs 20 --retry 5

# Proceed with the main command (e.g., starting the Rails server)
exec "$@"

