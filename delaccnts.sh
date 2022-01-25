#-----------------DELETE BAD ACCNTS.---------------#
#!/bin/bash
    echo "Delete Bad Accounts."
echo 
    read -p "Continue (y/n)? "
echo 
#If prompt is no >
if [[ $REPLY =~ n ]]; then
    exit 
fi
if [[ $REPLY =~ y ]]; then
    echo "Please enter username:"
    read -s username1
    echo "Please repeat the username:"
    read -s username2