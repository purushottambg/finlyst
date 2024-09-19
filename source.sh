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
#Execution of the above line means, things are good till now


#let's create separate directory for this task and add meaningful lines to it
dirName="${HOME}/advScripts/Finlyst/Data/$user$(date +%H%M%d%m%Y)"
mkdir -p "$dirName"
if [ $? -eq 0 ]; then    #if mkdir is successful then status will be 0
    echo "file has been creted"
else
    echo "Could not create file"
    exit 1  #flow must be aborted if file is not created
fi

./fileCreation.sh "$user" "$inputFile" "$dirName"