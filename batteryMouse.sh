#!/bin/bash
#   Script to check if your battery has already been charged
#   @author: Walderlan Sena <walderlan@mentesvirtuaissena.com>
#   Code: https://www.github.com/walderlansena/
#   Dependencies: acpi - yad
#   sudo apt-get install acpi && sudo apt-get install yad

if [ ! -e /usr/bin/yad ] || [ ! -e /usr/bin/acpi ];
then
    echo "The script could not find the required dependencies"
    exit 1
fi

while true;
do
    acpi -b |
    awk '$4 !~ /100/ {exit 1}' && {
        yad --center                        \
        --title="Battery Mouse"             \
        --image="baterriy.png"              \
        --image "dialog-info"               \
        --button=gtk-ok                     \
        --text="100% Charged Battery"       \
        --width=300                         \
        --height=100                        \
        --text-align=center                 \
        --window-icon="baterry.png";
        exit; }
    sleep 60
done
