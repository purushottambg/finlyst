#!/bin/bash  

function fileCreation(){
    echo "$2 file has been received for processing by $1"

    userName=$1                 #let's store the username in a meaningful way
    fileName=$2                 #file name stored

    transFile=$3/trans         #all the transactions are stored in the file
    dateFile=$3/dates         #Transaction dates are store    
    transType=$3/transType    #choose the type of transaction
    remBalance=$3/balance     #available balance
    finalFile=$3/$2         #final file with Human redability for the user

    touch $transFile            #File created
    touch $dateFile            #File created
    touch $transType            #File created
    touch $remBalance            #File created
    touch $finalFile            #File created

    if [ ! -e $transFile ]; then
    echo "Failed to create transaction file"
    exit 1
    elif [ ! -e $dateFile ]; then
    echo "Failed to create date file"
    exit 1
    elif [ ! -e $transType ]; then
    echo "Failed to create transaction type file"
    exit 1
    elif [ ! -e $remBalance ]; then
    echo "Failed to create remaining balance file"
    exit 1
    elif [ ! -e $finalFile ]; then
    echo "Failed to create final file"
    exit 1
    fi  

    awk '/UPI/ {print $0}' $fileName >> $transFile
    grep -E "[0-9]{2}-[0-9]{2}-[0-9]{4}" $fileName >> $dateFile
    grep -E "[0-9]{*}.[0-9]{*}" $fileName >> $remBalance

    # Count the number of transactions and print the result
    transCount=$(wc -l < "$transFile")
    echo "$transCount transactions are stored in $transFile"
}


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

fileCreation "$user" "$inputFile" "$dirName"     #Calling file creation process for further process

