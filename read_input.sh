#!/bin/bash

ReadLocation(){
#unset $loc;
loc='';
while [ "$loc" = "" ]
            do
                echo "Type in desired folder location:"
                read loc
		eval $1=$loc;
            done
}
