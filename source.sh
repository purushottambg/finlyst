#!/bin/bash  #Sh bang line

# if [ -z "$1" ] && [ -z "$2" ]; then #check if user has given the file and user name
    
#     echo "We have not received input file, Kindly provide file address."
    read -p "Enter User name: " user
    read -p "Enter file path: " inputFile

    if [ -z "$user" ]; then
        echo "User name not received"
        exit 1
    elif [ ! -e "$inputFile" ]; then
        echo "Input file is invalid"
        exit 1
    # else 
    #     $2="$inputFile"
    #     $1="$user"
    fi
#fi

echo "We are processing $inputFile file for $user!"