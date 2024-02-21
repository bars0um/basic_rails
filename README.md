# README

To start with, you must launch the system via

`docker-compose up`

This will run the create-app.sh script and ensure that the app folder is initialized with a barebones rails app.

The .env file contains a variety of variables which govern the initialization of the system and ensures that the db credentials are appropriately configured. These defaults may change from time to time, especially the db name which for the base rails template seems to be currently hard-coded to app_development.
