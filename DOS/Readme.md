# DOS

1. `manyuser.sh` attempts to overload the webserver's cpu by making many POST requests with invalid information (null bytes etc) to the login screen
2. `bruteforce.sh` with a parameter of the username to bruteforce, will use rockyou.txt to attempt to bruteforce into the account on the login screen