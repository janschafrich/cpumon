#! /bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi



if [ "$1" = "remove" ]; then

    echo "Removing cpu monitor and embeddec controller tool"
    sudo rm /usr/local/bin/ectool
    sudo rm /usr/local/bin/cpumon

    echo "Success"

else
    echo "copying cpu monitor and ectool to /usr/local/bin/"
    sudo cp ./cpumon /usr/local/bin/cpumon
    sudo cp ./ectool /usr/local/bin/ectool

    echo "Success"
fi
exit 0