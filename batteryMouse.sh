#!/bin/bash
#   Script to check if your battery has already been charged
#   @author: Walderlan Sena <walderlan@mentesvirtuaissena.com>
#   Code: https://www.github.com/walderlansena/
#   Dependencies: acpi - yad
#   sudo apt-get install acpi && sudo apt-get install yad

if [ ! -e /usr/bin/yad ] && [ ! -e /usr/bin/acpi ];
then
    echo "The script could not find the required dependencies"
    exit
fi

while true;
do
    sleep 60
    valueCurrent=$(acpi -b | cut -d " " -f 4 | sed 's/,//g' | sed 's/%//g')
    if [ "$valueCurrent" == "100" ];
    then
        yad --center                        \
        --title="Battery Mouse"             \
        --image="baterriy.png"              \
        --image "dialog-info"               \
        --button=gtk-ok                     \
        --text="100% Charged Battery"       \
        --width=300                         \
        --height=100                        \
        --text-align=center                 \
        --window-icon="baterry.png"         
    fi
done
