#!/bin/bash
#   Script to check if your battery has already been charged
#   @author: Walderlan Sena <walderlan@mentesvirtuaissena.com>
#   Code: https://www.github.com/walderlansena
#   Dependencies: acpi - yad
#   sudo apt-get install acpi && sudo apt-get install yad

valueCurrent=$(acpi -b | cut -d " " -f 4 | sed 's/,//g' | sed 's/%//g')

while true;
do
    sleep 180
    if [ "$valueCurrent" == "100" ];
    then
        yad --center                        \
        --title="Battery Mouse"             \
        --text="Bateria 100% Carregada"     \
        --width=300                         \
        --height=100                        \
        --text-align=center                 \
        --window-icon="baterry.png"         
    fi
done

