#!/bin/bash  

read -p "Enter User name: " user
read -p "Enter file path: " inputFile

if [ -z "$user" ]; then   #Validate the inputs
    echo "User name not received"
    exit 1
elif [ ! -f "$inputFile" ]; then
    echo "Input file is invalid"
    exit 1
fi

echo "We are processing $inputFile file for $user!"