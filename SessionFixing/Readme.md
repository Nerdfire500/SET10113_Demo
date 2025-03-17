# Session Fixing - How to

1. Upload `getsessionid.html` and `XSSCSRFSESSION.html` via profile picture file upload
2. Browse to `http://localhost:15000/getsessionid.html` (in a real situation, we would social engineer the user into browsing here)
3. In a real situation, the session id would be sent to a threat actor server, but in this situation we use it to transfer funds
4. We could use `posttransfer.sh` with our stolen sessionid to send a curl POST to transfer funds too