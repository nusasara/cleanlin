#!/bin/bash
# Bash Menu Script Diploma Denis Oblak

source show_menus.sh
source show_menus_analyze.sh
source show_menus_cleanup.sh
source show_menus_undo.sh
source analyze.sh
source cleanup.sh
source undo.sh
source report.sh

function main_menu
{
clear
local main_opt;

if [ ! -d "$scriptlogPath" ]; then
        mkdir -p $scriptlogPath
fi

until [ "$opt" = "q" ]; do
    
    show_menu main_opt;
    case $opt in
        1) clear;
        option_picked "Option 1 Picked - Analyze";
        
	show_submenu_analyze;
        submenu_analyze;
        ;;

        2) clear;
        option_picked "Option 2 Picked - Cleanup";
            
        show_submenu_cleanup;
        submenu_cleanup;            
        ;;

        3) clear;
        option_picked "Option 3 Picked - Undo";

        show_submenu_undo;
        submenu_undo;
        ;;

        4) clear;
        option_picked "Option 4 Picked - Report";

        submenu_report "$scriptlogPath";
        ;;
	

        q)exit;
        ;;


        *)clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
done
}

#scriptPath="/deniso2/scripts"
#scriptlogPath="/deniso2/scripts/log"
echo "St:" "$#"
if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters. Expected 2. Param1: scriptPath; Param2: scriptlogPath"
    exit
fi

scriptPath=$1
scriptlogPath=$2

main_menu
