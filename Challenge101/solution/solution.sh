#!/bin/bash

nmap -p- -A 10.10.10.91 --open

dirb http://10.10.10.91:5000/

#find the RSA key and then

chmod 600 key
ssh -i key roosa@10.10.10.91

# cd /home
# cd roosa
# cat user.txt
# ...
# cd work/blogfeed
# cat run-gunicorn.sh
# cd resource
# git log
# Change to another commit
# cat root.txt

