#!/bin/bash
source func.sh
source func_undo.sh
source show_menus.sh
source show_menus_undo.sh

undo_del_old_files(){
    opt=$1
    echo "undo_del_old_files; opt: $opt; "
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            option_picked "Undo Delete - Not accessed more than 30 days";
            undo_files "$scriptlogPath/cleanup_rm_old_30.log" "Undo - old files 30 days;"

	    show_submenu_undo_del_old_files opt;
            ;;

            2)
            clear;
            option_picked "Undo Delete - Not accessed more than 90 days";
	    undo_files "$scriptlogPath/cleanup_rm_old_90.log" "Undo - old files 90 days;"

            show_submenu_undo_del_old_files opt;
            ;;

            3)
            clear;
            option_picked "Undo Delete - Not accessed more than 180 days";
	    undo_files "$scriptlogPath/cleanup_rm_old_180.log" "Undo - old files 180 days;"

            show_submenu_undo_del_old_files opt;
            ;;

            4)
            clear;
            option_picked "Undo Delete - Not accessed more than 365 days";
	    undo_files "$scriptlogPath/cleanup_rm_old_365.log" "Undo - old files 365 days;"

            show_submenu_undo_del_old_files opt;
            ;;

            100)
            clear;
            show_submenu_cleanup;
            break ;;


        esac
        fi
    done

}

