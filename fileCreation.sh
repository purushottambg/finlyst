#!/bin/bash

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