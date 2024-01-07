#! /bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi



if [ "$1" = "remove" ]; then

    echo "Removing cpu monitor and embedded controller tool from /usr/local/bin"
    sudo rm /usr/local/bin/ectool
    sudo rm /usr/local/bin/cpumon

    echo "Success"

else
    echo "copying cpu monitor and ectool into /usr/local/bin/"
    sudo cp ./bin/cpumon /usr/local/bin/cpumon
    sudo cp ./bin/ectool /usr/local/bin/ectool

    echo "Success"
fi
exit 0